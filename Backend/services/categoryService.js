const Category = require("../models/categoryModel");
const AppError = require("../utils/appError");

const createCategory = async (categoryData) => {
  const newCategory = await Category.create(categoryData);
  return newCategory;
};

const getCategoryById = async (categoryId) => {
  const category = await Category.findById(categoryId);
  if (!category) {
    throw new AppError("No category found with that ID", 404);
  }
  return category;
};

const getAllCategories = async (filter = {}) => {
  const categories = await Category.find(filter);
  return categories;
};

const updateCategory = async (categoryId, updateData) => {
  const category = await Category.findByIdAndUpdate(categoryId, updateData, {
    new: true,
    runValidators: true,
  });

  if (!category) {
    throw new AppError("No category found with that ID", 404);
  }

  return category;
};

const deleteCategory = async (categoryId) => {
  const category = await Category.findByIdAndDelete(categoryId);
  if (!category) {
    throw new AppError("No category found with that ID", 404);
  }

  return category;
};

const getCategoriesByName = async (categoryNames) => {
  const categories = await Category.find({
    name: { $in: categoryNames },
  });

  if (categories.length !== categoryNames.length) {
    throw new AppError("One or more categories not found.", 400);
  }

  return categories;
};

module.exports = {
  createCategory,
  getCategoryById,
  getAllCategories,
  updateCategory,
  deleteCategory,
  getCategoriesByName,
};
