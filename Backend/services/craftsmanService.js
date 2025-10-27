const Craftsman = require("../models/craftsmanModel");
const User = require("../models/userModel");
const categoryService = require("./categoryService");
const AppError = require("../utils/appError");

// Convert specializations to category IDs
const convertSpecializationsToIds = async (specializations) => {
  if (
    !specializations ||
    !Array.isArray(specializations) ||
    specializations.length === 0
  ) {
    throw new AppError(
      "Specializations are required and must be an array.",
      400
    );
  }

  const categories = await categoryService.getCategoriesByName(specializations);
  return categories.map((c) => c._id);
};

// Create craftsman with proper user validation
const createCraftsman = async (craftsmanData, userId) => {
  // Validate that user exists and has craftsman role
  const user = await User.findById(userId);
  if (!user) {
    throw new AppError("User not found", 404);
  }
  console.log(user);

  if (user.role !== "craftsman") {
    throw new AppError(
      "User must have craftsman role to create craftsman profile",
      400
    );
  }

  // Check if craftsman profile already exists for this user
  const existingCraftsman = await Craftsman.findOne({ user: userId });
  if (existingCraftsman) {
    throw new AppError("Craftsman profile already exists for this user", 400);
  }

  // Convert specializations to IDs if provided
  if (craftsmanData.specializations) {
    craftsmanData.specializations = await convertSpecializationsToIds(
      craftsmanData.specializations
    );
  }

  // Ensure user field is set correctly
  craftsmanData.user = userId;

  const craftsman = await Craftsman.create(craftsmanData);
  return craftsman;
};

// Get craftsman by user ID
const getCraftsmanByUserId = async (userId) => {
  const craftsman = await Craftsman.findOne({ user: userId });
  if (!craftsman) {
    throw new AppError("Craftsman profile not found for this user", 404);
  }
  return craftsman;
};

// Update craftsman profile
const updateCraftsman = async (craftsmanId, updateData, userId) => {
  const craftsman = await Craftsman.findById(craftsmanId);
  if (!craftsman) {
    throw new AppError("Craftsman not found", 404);
  }

  // Verify ownership
  if (craftsman.user.toString() !== userId) {
    throw new AppError("You can only update your own craftsman profile", 403);
  }

  // Convert specializations to IDs if provided
  if (updateData.specializations) {
    updateData.specializations = await convertSpecializationsToIds(
      updateData.specializations
    );
  }

  const updatedCraftsman = await Craftsman.findByIdAndUpdate(
    craftsmanId,
    updateData,
    { new: true, runValidators: true }
  );

  return updatedCraftsman;
};

// Delete craftsman profile
const deleteCraftsman = async (craftsmanId, userId) => {
  const craftsman = await Craftsman.findById(craftsmanId);
  if (!craftsman) {
    throw new AppError("Craftsman not found", 404);
  }

  // Verify ownership
  if (craftsman.user.toString() !== userId) {
    throw new AppError("You can only delete your own craftsman profile", 403);
  }

  await Craftsman.findByIdAndDelete(craftsmanId);
  return craftsman;
};

module.exports = {
  convertSpecializationsToIds,
  createCraftsman,
  getCraftsmanByUserId,
  updateCraftsman,
  deleteCraftsman,
};
