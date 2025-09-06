const catchAsync = require("../utils/api/catchAsync");
const User = require("../models/userModel");
const Craftsman = require("../models/craftsmanModel");
const AppError = require("../utils/appError");
const factory = require("./handlerFactory");
const filterObj = require("../utils/filterObject");
const flattenObject = require("../utils/flattenObject");
const verifyOTP = require("../utils/auth/verifyOTP");
const { createSendToken, signToken } = require("../utils/auth/jwtUtils");
const createOTP = require("../utils/auth/createOTP");

//---------------------------------------------------

const getMe = (req, res, next) => {
  req.params.id = req.user.id;
  next();
};

const getMyReviews = (req, res, next) => {
  req.params.id = req.user.id;
  next();
};

// Name, location, specializations, hourlyRate, workSchedule, portfolio are allowed to be updated
const updateMe = catchAsync(async (req, res, next) => {
  const userFilteredBody = filterObj(req.body, "name", "location");
  const craftsmanFilteredBody = filterObj(
    req.body,
    "specializations",
    "hourlyRate",
    "workSchedule",
    "portfolio"
  );

  // Flatten the nested object to allow for not modifying the original object only that in the req body
  const userBody = flattenObject(userFilteredBody);
  const craftsmanBody = flattenObject(craftsmanFilteredBody);

  await User.findByIdAndUpdate(req.user.id, userBody, {
    new: true,
    runValidators: true,
  });

  if (req.user.role === "craftsman" && Object.keys(craftsmanBody).length > 0) {
    await Craftsman.findOneAndUpdate({ user: req.user.id }, craftsmanBody, {
      new: true,
      runValidators: true,
    });
  }

  const updatedUser = await User.findById(req.user.id);

  res.status(200).json({
    status: "success",
    data: {
      user: updatedUser,
    },
  });
});

const deleteMe = catchAsync(async (req, res, next) => {
  await User.findByIdAndUpdate(req.user.id, { isActive: false });
  res.status(204).json({
    status: "success",
    data: null,
  });
});

const sendUpdatePhoneOTP = catchAsync(async (req, res, next) => {
  const { newPhoneNumber } = req.body;

  if (!newPhoneNumber) {
    return next(new AppError("New phone number is required", 400));
  }

  await createOTP(newPhoneNumber);
  //await sendSMS({ phoneNumber: newPhoneNumber, otp });

  res.status(200).json({
    status: "success",
    message: "OTP sent successfully",
  });
});

const verifyUpdatePhoneOTP = catchAsync(async (req, res, next) => {
  const { newPhoneNumber, otp } = req.body;
  await verifyOTP(otp, newPhoneNumber);

  const updatedUser = await User.findByIdAndUpdate(
    req.user._id,
    {
      phoneNumber: newPhoneNumber,
      isVerified: true,
    },
    {
      new: true,
      runValidators: true,
    }
  );

  createSendToken(updatedUser, 200, res);
});

//---------------------------------------------------
const createUser = factory.createOne(User);
const getAllUsers = factory.getAll(User);
const getUser = factory.getOne(User, { path: "craftsman" });
const updateUser = factory.updateOne(User);
const deleteUser = factory.deleteOne(User);

module.exports = {
  getMe,
  updateMe,
  deleteMe,
  getMyReviews,
  sendUpdatePhoneOTP,
  verifyUpdatePhoneOTP,
  createUser,
  getAllUsers,
  getUser,
  updateUser,
  deleteUser,
};
