const catchAsync = require("../middlewares/catchAsync");
const User = require("../models/userModel");
const Craftsman = require("../models/craftsmanModel");
const AppError = require("../utils/appError");
const factory = require("./handlerFactory");
const filterObj = require("../utils/filterObject");
const flattenObject = require("../utils/flattenObject");
const verifyOTP = require("../utils/verifyOTP");
const { createSendTokens, signToken } = require("../utils/jwtUtils");
const createOTP = require("../utils/createOTP");
const craftsmanService = require("../services/craftsmanService");

//---------------------------------------------------
// Send the update phone number OTP
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

//---------------------------------------------------
// Verify the update phone number OTP
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

  createSendTokens(updatedUser, 200, res);
});

//---------------------------------------------------
const createUser = factory.createOne(User);
const getAllUsers = factory.getAll(User);
const getUser = factory.getOne(User, { path: "craftsman" });
const updateUser = factory.updateOne(User);
const deleteUser = factory.deleteOne(User);

module.exports = {
  sendUpdatePhoneOTP,
  verifyUpdatePhoneOTP,
  createUser,
  getAllUsers,
  getUser,
  updateUser,
  deleteUser,
};
