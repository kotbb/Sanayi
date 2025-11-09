import Category from "../models/categoryModel.js";
import factory from "./handlerFactory.js";
import categoryService from "../services/categoryService.js";

const getAllCategories = factory.getAll(Category);
const getCategory = factory.getOne(Category);
const createCategory = factory.createOne(Category);
const updateCategory = factory.updateOne(Category);
const deleteCategory = factory.deleteOne(Category);

export default {
  getAllCategories,
  getCategory,
  createCategory,
  updateCategory,
  deleteCategory,
};
