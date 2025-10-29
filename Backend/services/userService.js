const otpService = require("./otpService");
const User = require("../models/userModel");
const AppError = require("../utils/appError");
//------------------------------------------------------

const initiatePhoneUpdate = async (newPhoneNumber) => {
  const existingUser = await User.findOne({ phoneNumber: newPhoneNumber });
  if (existingUser) {
    throw new AppError("Phone number already in use", 400);
  }

  const { otp } = await otpService.createOTPDev(newPhoneNumber);
  return { otp };
};

module.exports = {
  initiatePhoneUpdate,
};
