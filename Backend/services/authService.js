import mongoose from "mongoose";
import User from "../models/userModel.js";
import Craftsman from "../models/craftsmanModel.js";
import AppError from "../utils/appError.js";
import Category from "../models/categoryModel.js";
import craftsmanService from "./craftsmanService.js";

// Register a user and a craftsman
const registerUserTransaction = async (userData, phoneNumber) => {
  const { role, name, location, specializations, hourlyRate, profilePicture } =
    userData;

  if (role === "admin") {
    throw new AppError("Admin registration is not allowed", 400);
  }
  const session = await mongoose.startSession();

  try {
    session.startTransaction();
    const [newUser] = await User.create(
      [
        {
          phoneNumber,
          role,
          name,
          location,
          profilePicture,
          isVerified: true,
        },
      ],
      { session }
    );
    if (role === "craftsman") {
      const specializationIds =
        await craftsmanService.convertSpecializationsToIds(specializations);

      await Craftsman.create(
        [
          {
            user: newUser._id,
            specializations: specializationIds,
            hourlyRate,
          },
        ],
        { session }
      );
    }
    await session.commitTransaction();
    return newUser;
  } catch (err) {
    await session.abortTransaction();
    throw new AppError(`Registeration failed: ${err.message}`, 500);
  } finally {
    session.endSession();
  }
};

export default registerUserTransaction ;
