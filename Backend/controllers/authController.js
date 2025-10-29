const AppError = require("../utils/appError");
const catchAsync = require("../middlewares/catchAsync");
const authService = require("../services/authService");
const otpService = require("../services/otpService");
const User = require("../models/userModel");
const jwt = require("jsonwebtoken");
const jwtUtils = require("../utils/jwtUtils");
const { promisify } = require("util");
const isValidPhoneNumber = require("../middlewares/validation/isValidPhoneNumber");
const tokenService = require("../services/tokenService");
//------------------------------------------------------

// Get new refresh access tokens
const getNewRefreshAccessTokens = catchAsync(async (req, res, next) => {
  const inputRefreshToken = req.body.refreshToken;
  const inputAccessToken = req.headers.authorization.split(" ")[1];

  if (!inputRefreshToken || !inputAccessToken) {
    return next(new AppError("Refresh and access token are required", 401));
  }

  const decoded = jwt.decode(inputAccessToken);
  if (!decoded) {
    return next(new AppError("Invalid access token", 401));
  }
  const user = await User.findById(decoded.data).select(
    "+refreshToken +refreshTokenExpiresAt"
  );
  if (!user) {
    return next(new AppError("User not found", 404));
  }
  // Compare input refresh token with stored refresh token (rotation protection)
  if (
    !user.refreshToken ||
    user.refreshTokenExpiresAt < Date.now() ||
    !(await user.correctRefreshToken(inputRefreshToken, user.refreshToken))
  ) {
    return next(new AppError("Invalid or expired refresh token", 401));
  }

  // Blacklist the old access token for extra security
  await tokenService.blacklistToken(inputAccessToken);

  // Generate new tokens
  const { accessToken, refreshToken } = await jwtUtils.getUserTokens(user);

  res.status(200).json({
    status: "success",
    token: accessToken,
    refreshToken,
  });
});

// Send the register OTP
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
  const otp = await otpService.createOTPDev(phoneNumber);

  res.status(200).json({
    status: "success",
    message: "OTP sent successfully",
    // TODO: Send OTP to user
  });
});

// Verify the register OTP
const verifyRegisterOTP = catchAsync(async (req, res, next) => {
  const { otp, phoneNumber } = req.body;
  await otpService.verifyOTP(otp, phoneNumber);

  const registerationToken = jwtUtils.createAccessToken(
    phoneNumber,
    process.env.JWT_ACCESS_EXPIRES_IN
  );
  res.status(200).json({
    status: "success",
    message: "OTP verified successfully",
    registerationToken,
  });
});

// Complete the register
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
  jwtUtils.createSendTokens(newUser, 201, res);
});

// Login
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
  jwtUtils.createSendTokens(user, 200, res);
});

// Login admin
const loginAdmin = catchAsync(async (req, res, next) => {
  const { phoneNumber, password } = req.body;
  if (!phoneNumber || !password) {
    return next(new AppError("Phone number and password are required", 400));
  }

  const user = await User.findOne({ phoneNumber }).select("+password");

  if (!user || !(await user.correctPassword(password, user.password))) {
    return next(new AppError("Invalid phone number or password", 401));
  }

  if (user.role !== "admin") {
    return next(
      new AppError("You are not authorized to access this resource", 403)
    );
  }

  jwtUtils.createSendTokens(user, 200, res);
});

// Logout
const logout = catchAsync(async (req, res, next) => {
  const user = req.user;
  const token = req.headers.authorization.split(" ")[1];

  // Blacklist the current access token
  await tokenService.blacklistToken(token);

  // Clear user's refresh token and expiry from database
  user.refreshToken = null;
  user.refreshTokenExpiresAt = null;
  await user.save({ validateBeforeSave: false });

  res.status(200).json({
    status: "success",
    message: "Logged out successfully",
  });
});

module.exports = {
  login,
  loginAdmin,
  sendRegisterOTP,
  verifyRegisterOTP,
  completeRegister,
  getNewRefreshAccessTokens,
  logout,
};
