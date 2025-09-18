const jwt = require("jsonwebtoken");

//------------------------------------------------------

const signToken = (data, expiresIn = process.env.JWT_EXPIRES_IN) => {
  return jwt.sign({ data }, process.env.JWT_SECRET, {
    expiresIn,
  });
};
const createSendToken = (user, statusCode, res) => {
  const token = signToken(user._id);
  res.status(statusCode).json({
    status: "success",
    token,
    data: { user },
  });
};

module.exports = {
  signToken,
  createSendToken,
};
