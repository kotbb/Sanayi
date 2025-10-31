// User roles
const USER_ROLES = {
  ADMIN: "admin",
  CLIENT: "client",
  CRAFTSMAN: "craftsman",
};

// Booking statuses
const BOOKING_STATUS = {
  PENDING: "pending",
  CONFIRMED: "confirmed",
  COMPLETED: "completed",
  CANCELLED: "cancelled",
};

// API response statuses
const API_STATUS = {
  SUCCESS: "success",
  ERROR: "error",
  FAIL: "fail",
};

// HTTP status codes
const HTTP_STATUS = {
  OK: 200,
  CREATED: 201,
  NO_CONTENT: 204,
  BAD_REQUEST: 400,
  UNAUTHORIZED: 401,
  FORBIDDEN: 403,
  NOT_FOUND: 404,
  INTERNAL_SERVER_ERROR: 500,
};

// File upload limits
const UPLOAD_LIMITS = {
  MAX_FILE_SIZE: 5 * 1024 * 1024, // 5MB
  MAX_PORTFOLIO_IMAGES: 5,
  USER_PHOTO_DIMENSIONS: { width: 1024, height: 1024 },
  PORTFOLIO_IMAGE_DIMENSIONS: { width: 1200, height: 800 },
};

// Rate limiting
const RATE_LIMITS = {
  GENERAL: {
    max: 100,
    windowMs: 60 * 60 * 1000, // 1 hour
  },
  LOGIN: {
    max: 50,
    windowMs: 15 * 60 * 1000, // 15 minutes
  },
};

// JWT token types
const TOKEN_TYPES = {
  ACCESS: "access",
  REFRESH: "refresh",
  REGISTRATION: "registration",
};

// Redis keys
const REDIS_KEYS = {
  BLACKLIST_PREFIX: "blacklist:",
  OTP_PREFIX: "otp:",
};

module.exports = {
  USER_ROLES,
  BOOKING_STATUS,
  API_STATUS,
  HTTP_STATUS,
  UPLOAD_LIMITS,
  RATE_LIMITS,
  TOKEN_TYPES,
  REDIS_KEYS,
};
