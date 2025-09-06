const createOTP = require("../utils/createOTP");
const User = require("../models/userModel");
const AppError = require("../utils/appError");
//------------------------------------------------------

const initiatePhoneUpdate = async (newPhoneNumber) => {
  const existingUser = await User.findOne({ phoneNumber: newPhoneNumber });
  if (existingUser) {
    throw new AppError("Phone number already in use", 400);
  }

  const { otp } = await createOTP(newPhoneNumber);
  return { otp };
};

module.exports = {
  initiatePhoneUpdate,
};
