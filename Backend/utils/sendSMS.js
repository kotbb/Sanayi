const twilio = require("twilio");

const sendSMS = async (params) => {
  const client = new twilio(
    process.env.TWILIO_SID,
    process.env.TWILIO_AUTH_TOKEN
  );
  await client.messages.create({
    body: `Your OTP is ${params.otp}. It will expire in ${process.env.OTP_EXPIRES_IN}`,
    from: process.env.TWILIO_PHONE_NUMBER,
    to: params.phoneNumber,
  });
};
module.exports = sendSMS;
