const catchAsync = require("../middlewares/catchAsync");
const Company = require("../models/companyModel");
const factory = require("./handlerFactory");
const AppError = require("../utils/appError");

const createCompany = factory.createOne(Company);
const getAllCompanies = factory.getAll(Company);
const getCompany = factory.getOne(Company);
const updateCompany = factory.updateOne(Company);
const deleteCompany = factory.deleteOne(Company);

module.exports = {
  createCompany,
  getAllCompanies,
  getCompany,
  updateCompany,
  deleteCompany,
};
