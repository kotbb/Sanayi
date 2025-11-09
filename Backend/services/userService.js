import otpService from "./otpService.js";
import User from "../models/userModel.js";
import AppError from "../utils/appError.js";
//------------------------------------------------------

const initiatePhoneUpdate = async (newPhoneNumber) => {
  const existingUser = await User.findOne({ phoneNumber: newPhoneNumber });
  if (existingUser) {
    throw new AppError("Phone number already in use", 400);
  }

  const { otp } = await otpService.createOTPDev(newPhoneNumber);
  return { otp };
};

export default initiatePhoneUpdate ;
