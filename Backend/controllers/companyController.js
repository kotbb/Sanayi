const Company = require("../models/companyModel");
const factory = require("./handlerFactory");

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
