const AppError = require("./appError");
const crypto = require("crypto");
const redisClient = require("./redisClient");
//------------------------------------------------------

const verifyOTP = async (otp, phoneNumber) => {
  const storedOtp = await redisClient.get(`otp:${phoneNumber}`);

  console.log(storedOtp);
  if (!storedOtp) {
    throw new AppError("OTP is invalid or has expired. Please try again.", 400);
  }

  const newCalculatedHash = crypto
    .createHmac("sha256", process.env.OTP_SECRET)
    .update(otp)
    .digest("hex");

  if (newCalculatedHash !== storedOtp) {
    throw new AppError("Invalid OTP", 400);
  }

  await redisClient.del(`otp:${phoneNumber}`);
};

module.exports = verifyOTP;
