const catchAsync = require("../middlewares/catchAsync");
const User = require("../models/userModel");
const Craftsman = require("../models/craftsmanModel");
const AppError = require("../utils/appError");
const filterObj = require("../utils/filterObject");
const flattenObject = require("../utils/flattenObject");
const craftsmanService = require("../services/craftsmanService");

//---------------------------------------------------
// Get the logged in user data
const getMe = catchAsync(async (req, res, next) => {
  const user = await User.findById(req.user.id);
  res.status(200).json({
    status: "success",
    data: { user },
  });
});

// Update the logged in user data
const updateMe = catchAsync(async (req, res, next) => {
  const filteredBody = filterObj(req.body, "name", "location");

  if (req.file) {
    filteredBody.profilePicture = req.file.filename;
  }

  // Flatten the nested object to allow for not modifying the original object only that in the req body
  const flattenedBody = flattenObject(filteredBody);

  const updatedUser = await User.findByIdAndUpdate(req.user.id, flattenedBody, {
    new: true,
    runValidators: true,
  });

  res.status(200).json({
    status: "success",
    data: {
      user: updatedUser,
    },
  });
});

//---------------------------------------------------
// Update the logged in craftsman profile data
const updateMyCraftsmanProfile = catchAsync(async (req, res, next) => {
  // 1. Check if the craftsman profile exists.
  if (!req.craftsman) {
    return next(new AppError("No craftsman profile found for this user.", 404));
  }

  // 2. Filter the simple, updatable fields from the request body.
  const filteredBody = filterObj(req.body, "hourlyRate", "workSchedule");

  // 3. Handle specializations separately.
  if (req.body.specializations) {
    const specializationIds =
      await craftsmanService.convertSpecializationsToIds(
        req.body.specializations
      );
    filteredBody.specializations = specializationIds;
  }

  // 4. Update the document
  const updatedCraftsman = await Craftsman.findOneAndUpdate(
    { user: req.user.id },
    filteredBody,
    {
      new: true,
      runValidators: true,
    }
  );

  res.status(200).json({
    status: "success",
    data: {
      craftsman: updatedCraftsman,
    },
  });
});

//---------------------------------------------------
// Update the logged in craftsman portfolio data
const updateMyPortfolio = catchAsync(async (req, res, next) => {
  const { title, description, images } = req.body;

  console.log(images);
  const updatedCraftsman = await Craftsman.findOneAndUpdate(
    { user: req.user.id },
    {
      $push: {
        portfolio: {
          title,
          description,
          images,
        },
      },
    },
    { new: true, runValidators: true }
  );

  if (!updatedCraftsman) {
    return next(new AppError("No craftsman profile found for this user.", 404));
  }

  res.status(200).json({
    status: "success",
    data: {
      craftsman: updatedCraftsman,
    },
  });
});

//---------------------------------------------------
const removePortfolioItem = catchAsync(async (req, res, next) => {
  const { portfolioId } = req.params;

  const updatedCraftsman = await Craftsman.findOneAndUpdate(
    { user: req.user.id },
    {
      // Use $pull to remove an item from an array that matches a condition
      $pull: {
        portfolio: { _id: portfolioId },
      },
    },
    { new: true }
  );

  if (!updatedCraftsman) {
    return next(new AppError("No craftsman profile found for this user.", 404));
  }

  res.status(200).json({
    status: "success",
    data: {
      craftsman: updatedCraftsman,
    },
  });
});

//---------------------------------------------------
// Delete the logged in user data
const deleteMe = catchAsync(async (req, res, next) => {
  await User.findByIdAndUpdate(req.user.id, { isActive: false });
  res.status(204).json({
    status: "success",
    data: null,
  });
});

module.exports = {
  getMe,
  updateMe,
  updateMyCraftsmanProfile,
  updateMyPortfolio,
  removePortfolioItem,
  deleteMe,
};
