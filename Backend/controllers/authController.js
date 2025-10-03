const AppError = require("../utils/appError");
const catchAsync = require("../middlewares/catchAsync");
const authService = require("../services/authService");
const createOTP = require("../utils/createOTP");
const verifyOTP = require("../utils/verifyOTP");
const User = require("../models/userModel");
const Craftsman = require("../models/craftsmanModel");
const jwt = require("jsonwebtoken");
const {
  createAccessToken,
  createSendTokens,
  getUserTokens,
} = require("../utils/jwtUtils");
const { promisify } = require("util");
const isValidPhoneNumber = require("../utils/validators/isValidPhoneNumber");

//------------------------------------------------------

const getNewRefreshAccessTokens = catchAsync(async (req, res, next) => {
  const inputRefreshToken = req.body.refreshToken;
  const inputAccessToken = req.headers.authorization.split(" ")[1];

  if (!inputRefreshToken || !inputAccessToken) {
    return next(new AppError("Refresh and access token are required", 401));
  }

  const decoded = jwt.decode(inputAccessToken);
  if(!decoded) {
    return next(new AppError("Invalid access token", 401));
  }
  const user = await User.findById(decoded.data).select("+refreshToken +refreshTokenExpiresAt");
  if (!user) {
    return next(new AppError("User not found", 404));
  }
  // Compare input refresh token with stored refresh token (rotation protection)
  if (!user.refreshToken || user.refreshTokenExpiresAt < Date.now() || 
     (!await user.correctRefreshToken(inputRefreshToken, user.refreshToken))) {
    return next(new AppError("Invalid or expired refresh token", 401));
  }

  const {accessToken, refreshToken} = await getUserTokens(user);
  user.refreshToken = refreshToken;
  await user.save({ validateBeforeSave: false });

  res.status(200).json({
    status: "success",
    token: accessToken,
    refreshToken,
  });
});

const sendRegisterOTP = catchAsync(async (req, res, next) => {
  const { phoneNumber } = req.body;
  if (!phoneNumber || !isValidPhoneNumber(phoneNumber)) {
    return next(new AppError("Invalid phone number", 400));
  }
  // Check if user exists
  const existingUser = await User.findOne({ phoneNumber });
  if (existingUser) {
    throw new AppError("A user with this phone number already exists.", 400);
  }

  // Create OTP
  const otp = await createOTP(phoneNumber);

  res.status(200).json({
    status: "success",
    message: "OTP sent successfully",
    // TODO: Send OTP to user
  });
});

const verifyRegisterOTP = catchAsync(async (req, res, next) => {
  const { otp, phoneNumber } = req.body;
  await verifyOTP(otp, phoneNumber);

  const registerationToken = createAccessToken(
    phoneNumber,
    process.env.JWT_ACCESS_EXPIRES_IN
  );
  res.status(200).json({
    status: "success",
    message: "OTP verified successfully",
    registerationToken,
  });
});

const completeRegister = catchAsync(async (req, res, next) => {
  const registerationToken = req.headers.authorization.split(" ")[1];
  if (!registerationToken) {
    return next(new AppError("Registeration token is required", 400));
  }
  const decoded = await promisify(jwt.verify)(
    registerationToken,
    process.env.JWT_ACCESS_SECRET
  );

  const phoneNumber = decoded.data;
  if (!phoneNumber) {
    return next(new AppError("Invalid registration token", 401));
  }

  // We use Transaction to ensure that the user and craftsman are created together and if one fails, the other is rolled back
  const newUser = await authService.registerUserTransaction(
    req.body,
    phoneNumber
  );
  createSendTokens(newUser, 201, res);
});

const login = catchAsync(async (req, res, next) => {
  const phoneNumber = req.body.phoneNumber;
  if (!phoneNumber) {
    return next(new AppError("Phone number is required", 400));
  }

  const user = await User.findOne({ phoneNumber });

  if (!user) {
    return next(new AppError("User not found", 404));
  }

  if (user.role === "admin") {
    return next(new AppError("Admin login here not allowed", 400));
  }
  createSendTokens(user, 200, res);
});

const loginAdmin = catchAsync(async (req, res, next) => {
  const { phoneNumber, password } = req.body;
  if (!phoneNumber || !password) {
    return next(new AppError("Phone number and password are required", 400));
  }

  const user = await User.findOne({ phoneNumber }).select("+password");

  if (!user || (await user.correctPassword(user.password, password))) {
    return next(new AppError("Invalid phone number or password", 401));
  }
  createSendTokens(user, 200, res);
});

const loadCraftsmanProfile = catchAsync(async (req, res, next) => {
  if (req.user.role !== "craftsman") {
    return next();
  }

  const craftsman = await Craftsman.findOne({ user: req.user.id });

  req.craftsman = craftsman;
  next();
});

// Set the logged in user id in the req.params
const setLoggedId = (req, res, next) => {
  if (req.user.role === "client") {
    req.params.clientId = req.user.id;
  } else if (req.user.role === "craftsman") {
    req.params.craftsmanId = req.craftsman.id;
  }
  next();
};

//------------------------------------------------------

const restrictTo = (...roles) => {
  return (req, res, next) => {
    if (!roles.includes(req.user.role)) {
      return next(
        new AppError("You do not have permission to perform this action", 403)
      );
    }
    next();
  };
};

const protect = catchAsync(async (req, res, next) => {
  // 1) Get token and check if it's there
  let token;
  if (
    req.headers.authorization &&
    req.headers.authorization.startsWith("Bearer")
  ) {
    token = req.headers.authorization.split(" ")[1];
  }
  if (!token) {
    return next(
      new AppError("You are not logged in! Please log in to get access.", 401)
    );
  }

  // 2) Verify token
  const decoded = await promisify(jwt.verify)(
    token,
    process.env.JWT_ACCESS_SECRET
  );

  // 3) Check if user exists, data is the user's id
  const currentUser = await User.findById(decoded.data);
  if (!currentUser) {
    return next(
      new AppError(
        "The user belonging to this token does no longer exist.",
        401
      )
    );
  }
  req.user = currentUser;
  next();
});

const checkOwnerShip = (Model, userFieldNames) => {
  return catchAsync(async (req, res, next) => {
    const doc = await Model.findById(req.params.id);
    if (!doc) {
      return next(new AppError("No document found with that ID", 404));
    }

    console.log(doc);
    // 3) Check if the document belongs to the admin
    if (req.user.role === "admin") {
      req.doc = doc;
      return next();
    }
    let isOwner = false;
    if (req.user.role === "craftsman" && userFieldNames.includes("craftsman")) {
      const craftsman = await Craftsman.findOne({ user: req.user.id });
      isOwner = doc.craftsman?.toString() === craftsman.id;
    } else {
      isOwner = doc.client?.toString() === req.user.id;
    }
    if (!isOwner) {
      return next(
        new AppError("You do not have permission to perform this action", 403)
      );
    }

    req.doc = doc;
    next();
  });
};

module.exports = {
  login,
  loginAdmin,
  protect,
  restrictTo,
  sendRegisterOTP,
  verifyRegisterOTP,
  completeRegister,
  checkOwnerShip,
  loadCraftsmanProfile,
  setLoggedId,
  getNewRefreshAccessTokens,
};
