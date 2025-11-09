import { redisClient } from "../config/redis.js";
import jwt from "jsonwebtoken";
import AppError from "../utils/appError.js";

const blacklistToken = async (token, ttlSeconds = null) => {
  try {
    const decoded = jwt.decode(token);
    if (!decoded) {
      throw new AppError("Invalid token format", 400);
    }

    // Calculate TTL - use provided TTL or calculate from token expiry
    let ttl;
    if (ttlSeconds) {
      ttl = ttlSeconds;
    } else {
      const now = Math.floor(Date.now() / 1000);
      ttl = Math.max(0, decoded.exp - now);
    }

    // Only blacklist if token hasn't already expired
    if (ttl > 0) {
      const tokenId = `${decoded.data}_${decoded.iat}`;
      await redisClient.setEx(`blacklist:${tokenId}`, ttl, "blacklisted");
    }
  } catch (error) {
    throw new AppError("Error blacklisting token", 500);
  }
};

const isTokenBlacklisted = async (token) => {
  try {
    const decoded = jwt.decode(token);
    if (!decoded) {
      return true;
    }

    const tokenId = `${decoded.data}_${decoded.iat}`;
    const result = await redisClient.get(`blacklist:${tokenId}`);
    return result !== null;
  } catch (error) {
    console.log("ERROR", error);
    return true; // On error, consider token blacklisted for security
  }
};

const clearBlacklistedTokens = async () => {
  const pattern = "blacklist:*";
  const keys = await redisClient.keys(pattern);

  if (keys.length > 0) {
    await redisClient.del(keys);
  }
};

export default { blacklistToken, isTokenBlacklisted, clearBlacklistedTokens };
