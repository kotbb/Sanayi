const Category = require("../models/categoryModel");
const AppError = require("../utils/appError");

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

  const categories = await Category.find({
    name: { $in: specializations },
  });

  if (categories.length !== specializations.length) {
    throw new AppError(
      "One or more specializations not found in the categories.",
      400
    );
  }

  return categories.map((c) => c._id);
};

module.exports = {
  convertSpecializationsToIds,
};
