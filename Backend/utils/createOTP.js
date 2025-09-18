const crypto = require("crypto");
const parseTimeToMS = require("./parseTimeToMS");
const redisClient = require("./redisClient");
//------------------------------------------------------

const createOTP = async (phoneNumber) => {
  //const otp = crypto.randomInt(100000, 1000000).toString();
  const otp = "1111";

  const ttl = parseTimeToMS(process.env.OTP_EXPIRES_IN) / 1000;

  const hashedOTP = crypto
    .createHmac("sha256", process.env.OTP_SECRET)
    .update(otp)
    .digest("hex");

  await redisClient.set(`otp:${phoneNumber}`, hashedOTP, { EX: ttl });

  console.log(`OTP for ${phoneNumber}: ${otp}`);

  return otp;
};

module.exports = createOTP;
