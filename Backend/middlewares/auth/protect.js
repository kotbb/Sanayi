const catchAsync = require("../catchAsync");
const AppError = require("../../utils/appError");
const User = require("../../models/userModel");
const jwt = require("jsonwebtoken");
const { promisify } = require("util");
const tokenService = require("../../services/tokenService");

const protect = catchAsync(async (req, res, next) => {
  // 1) Get token and check if it's there
  let token;
  if (
    req.headers.authorization &&
    req.headers.authorization.startsWith("Bearer")
  ) {
    token = req.headers.authorization.split(" ")[1];
  }
  if (!token) {
    return next(
      new AppError("You are not logged in! Please log in to get access.", 401)
    );
  }


  // 2) Check if token is blacklisted
  const isBlacklisted = await tokenService.isTokenBlacklisted(token);
  if (isBlacklisted) {
    return next(
      new AppError("This token has been invalidated. Please log in again.", 401)
    );
  }

  // 3) Verify token
  const decoded = await promisify(jwt.verify)(
    token,
    process.env.JWT_ACCESS_SECRET
  );

  // 4) Check if user exists, data is the user's id
  const currentUser = await User.findById(decoded.data);
  if (!currentUser) {
    return next(
      new AppError(
        "The user belonging to this token does no longer exist.",
        401
      )
    );
  }
  req.user = currentUser;
  next();
});

module.exports = protect;
