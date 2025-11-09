import AppError from "../utils/appError.js";
import crypto from "crypto";
import { redisClient } from "../config/redis.js";
import { sendSMS } from "./smsService.js";

const generateOTP = (length = 6) => {
  const digits = "0123456789";
  let otp = "";
  for (let i = 0; i < length; i++) {
    otp += digits[Math.floor(Math.random() * 10)];
  }
  return otp;
};

const createOTPHash = (otp) => {
  return crypto
    .createHmac("sha256", process.env.OTP_SECRET)
    .update(otp)
    .digest("hex");
};

const sendOTP = async (phoneNumber, otp) => {
  await sendSMS({ phoneNumber, otp });
};

const storeOTP = async (phoneNumber, otp, expirationTime = 300) => {
  const hashedOTP = createOTPHash(otp);
  await redisClient.setex(`otp:${phoneNumber}`, expirationTime, hashedOTP);
};

const generateAndSendOTP = async (
  phoneNumber,
  length = 6,
  expirationTime = 300
) => {
  const otp = generateOTP(length);
  await storeOTP(phoneNumber, otp, expirationTime);
  await sendOTP(phoneNumber, otp);
  return otp;
};

const verifyOTP = async (otp, phoneNumber) => {
  const storedOtp = await redisClient.get(`otp:${phoneNumber}`);

  if (!storedOtp) {
    throw new AppError("OTP is invalid or has expired. Please try again.", 400);
  }

  const newCalculatedHash = createOTPHash(otp);

  if (newCalculatedHash !== storedOtp) {
    throw new AppError("Invalid OTP", 400);
  }

  // Delete OTP after successful verification
  await redisClient.del(`otp:${phoneNumber}`);
};

const hasOTP = async (phoneNumber) => {
  const storedOtp = await redisClient.get(`otp:${phoneNumber}`);
  return !!storedOtp;
};

const deleteOTP = async (phoneNumber) => {
  await redisClient.del(`otp:${phoneNumber}`);
};

const createOTPDev = async (phoneNumber) => {
  // For development/testing, using fixed OTP
  const otp = "1111";

  const ttl = parseInt(process.env.OTP_EXPIRES_IN) || 300; // Default 5 minutes

  await storeOTP(phoneNumber, otp, ttl);

  console.log(`OTP for ${phoneNumber}: ${otp}`);

  return otp;
};

export default {
  generateOTP,
  createOTPHash,
  sendOTP,
  storeOTP,
  generateAndSendOTP,
  verifyOTP,
  hasOTP,
  deleteOTP,
  createOTPDev,
};
