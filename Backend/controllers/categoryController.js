const Category = require("../models/categoryModel");
const factory = require("./handlerFactory");
const categoryService = require("../services/categoryService");

const getAllCategories = factory.getAll(Category);
const getCategory = factory.getOne(Category);
const createCategory = factory.createOne(Category);
const updateCategory = factory.updateOne(Category);
const deleteCategory = factory.deleteOne(Category);

module.exports = {
  getAllCategories,
  getCategory,
  createCategory,
  updateCategory,
  deleteCategory,
};
