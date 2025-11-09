import catchAsync from "../middlewares/catchAsync.js";
import User from "../models/userModel.js";
import AppError from "../utils/appError.js";
import factory from "./handlerFactory.js";
import otpService from "../services/otpService.js";
import jwtUtils from "../utils/jwtUtils.js";

//---------------------------------------------------
// Send the update phone number OTP
const sendUpdatePhoneOTP = catchAsync(async (req, res, next) => {
  const { newPhoneNumber } = req.body;

  if (!newPhoneNumber) {
    return next(new AppError("New phone number is required", 400));
  }

  await otpService.createOTPDev(newPhoneNumber);
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
  await otpService.verifyOTP(otp, newPhoneNumber);

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

  jwtUtils.createSendTokens(updatedUser, 200, res);
});

//---------------------------------------------------
const createUser = factory.createOne(User);
const getAllUsers = factory.getAll(User);
const getUser = factory.getOne(User, { path: "craftsman" });
const updateUser = factory.updateOne(User);
const deleteUser = factory.deleteOne(User);

export default {
  sendUpdatePhoneOTP,
  verifyUpdatePhoneOTP,
  createUser,
  getAllUsers,
  getUser,
  updateUser,
  deleteUser,
};
