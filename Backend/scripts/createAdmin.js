import mongoose from "mongoose";
import dotenv from "dotenv";
import readline from "readline";
import User from "../models/userModel.js";

dotenv.config({ path: "./config.env" });

const DB = process.env.DATABASE.replace(
  "<PASSWORD>",
  process.env.DATABASE_PASSWORD
);

const createAdmin = async () => {
  try {
    await mongoose.connect(DB);
    console.log("DB connection successful!");

    const rl = readline.createInterface({
      input: process.stdin,
      output: process.stdout,
    });

    const name = await new Promise((resolve) =>
      rl.question("Enter admin name: ", resolve)
    );
    const phoneNumber = await new Promise((resolve) =>
      rl.question("Enter admin phone number: ", resolve)
    );
    const password = await new Promise((resolve) =>
      rl.question("Enter admin password: ", resolve)
    );

    console.log("Creating admin user...");
    await User.create({
      name,
      phoneNumber,
      password,
      role: "admin",
      isVerified: true,
    });

    console.log("Admin user created successfully!");
  } catch (err) {
    console.error("Error creating admin user:", err);
  } finally {
    rl.close();
    mongoose.connection.close();
  }
};

createAdmin();
