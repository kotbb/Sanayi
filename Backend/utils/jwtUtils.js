const jwt = require("jsonwebtoken");
const crypto = require("crypto");
const parseTimeToMS = require("./parseTimeToMS");

//------------------------------------------------------

const createAccessToken = (
  data,
  expiresIn = process.env.JWT_ACCESS_EXPIRES_IN
) => {
  return jwt.sign({ data }, process.env.JWT_ACCESS_SECRET, {
    expiresIn,
  });
};

const createRefreshToken = () => {
  const refreshToken = crypto.randomBytes(32).toString("hex");
  const refreshTokenExpiresAt = new Date(
    Date.now() + parseTimeToMS(process.env.JWT_REFRESH_EXPIRES_IN)
  );
  return { refreshToken, refreshTokenExpiresAt };
};

const getUserTokens = async (user) => {
  const accessToken = createAccessToken(user._id);
  const { refreshToken, refreshTokenExpiresAt } = createRefreshToken();

  user.refreshToken = refreshToken;
  user.refreshTokenExpiresAt = refreshTokenExpiresAt;
  await user.save({ validateBeforeSave: false });


  return { user, accessToken, refreshToken };
};
const createSendTokens = async (user, statusCode, res) => {
  const {
    user: updatedUser,
    accessToken,
    refreshToken,
  } = await getUserTokens(user);

  user.refreshToken = undefined;

  user.refreshTokenExpiresAt = undefined;

  res.status(statusCode).json({
    status: "success",
    token: accessToken,
    refreshToken,
    data: { user: updatedUser },
  });
};

module.exports = {
  createAccessToken,
  createRefreshToken,
  createSendTokens,
  getUserTokens,
};
