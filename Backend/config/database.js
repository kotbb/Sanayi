import mongoose from "mongoose";
import { fileURLToPath } from "url";
import path from "path";
import dotenv from "dotenv";
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

dotenv.config({ path: path.join(__dirname, "../config.env") });

const connectDB = async () => {
  try {
    const DB = process.env.DATABASE.replace(
      "<PASSWORD>",
      process.env.DATABASE_PASSWORD
    );

    await mongoose.connect(DB, {
      serverSelectionTimeoutMS: 30000,
      socketTimeoutMS: 45000,
    });
    console.log("DB connection successful!");
  } catch (error) {
    if (process.env.NODE_ENV === "production") {
      console.error("Continuing without database connection in serverless environment");
    } else {
      console.error("Database connection error:", error);
      process.exit(1);
    }
  }
};

export default connectDB;
