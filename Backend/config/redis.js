import { createClient } from "redis";
import { fileURLToPath } from "url";
import path from "path";
import dotenv from "dotenv";
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

dotenv.config({ path: path.join(__dirname, "../config.env") });

const redisClient = createClient({
  username: "default",
  password: process.env.REDIS_PASSWORD,
  socket: {
    host: "redis-19383.crce176.me-central-1-1.ec2.redns.redis-cloud.com",
    port: 19383,
    connectTimeout: 5000,
    commandTimeout: 5000,
  },
});

redisClient.on("error", (err) => console.log("Redis Client Error", err));

const connectRedis = async () => {
  try {
    if (!redisClient.isOpen) {
      await redisClient.connect();
      console.log("Redis connected successfully");
    }
  } catch (error) {
    console.error("Redis connection error:", error);
    if (process.env.NODE_ENV === "production") {
      console.error(
        "Continuing without Redis connection in serverless environment"
      );
    } else {
      throw error;
    }
  }
};

export { redisClient, connectRedis };
