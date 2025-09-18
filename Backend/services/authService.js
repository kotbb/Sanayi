const mongoose = require("mongoose");
const User = require("../models/userModel");
const Craftsman = require("../models/craftsmanModel");
const AppError = require("../utils/appError");
const Category = require("../models/categoryModel");
const craftsmanService = require("./craftsmanService");

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

module.exports = {
  registerUserTransaction,
};
