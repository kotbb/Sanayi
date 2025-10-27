const rateLimit = require("express-rate-limit");

// Stricter rate limiting for login endpoints
const loginLimiter = rateLimit({
  max: 50, // 50 attempts
  windowMs: 15 * 60 * 1000, // 15 minutes
  message:
    "Too many login attempts from this IP, please try again after 15 minutes",
  standardHeaders: true,
  legacyHeaders: false,
});

module.exports = {
  loginLimiter,
};
