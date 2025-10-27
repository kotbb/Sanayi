const Company = require("../models/companyModel");
const AppError = require("../utils/appError");

const createCompany = async (companyData) => {
  const newCompany = await Company.create(companyData);
  return newCompany;
};

const getCompanyById = async (companyId, popOptions) => {
  let query = Company.findById(companyId);
  if (popOptions) query = query.populate(popOptions);

  const company = await query;
  if (!company) {
    throw new AppError("No company found with that ID", 404);
  }

  return company;
};

const getAllCompanies = async (filter = {}, popOptions) => {
  let query = Company.find(filter);
  if (popOptions) query = query.populate(popOptions);

  const companies = await query;
  return companies;
};

const updateCompany = async (companyId, updateData) => {
  const company = await Company.findByIdAndUpdate(companyId, updateData, {
    new: true,
    runValidators: true,
  });

  if (!company) {
    throw new AppError("No company found with that ID", 404);
  }

  return company;
};

const deleteCompany = async (companyId) => {
  const company = await Company.findByIdAndDelete(companyId);
  if (!company) {
    throw new AppError("No company found with that ID", 404);
  }

  return company;
};

module.exports = {
  createCompany,
  getCompanyById,
  getAllCompanies,
  updateCompany,
  deleteCompany,
};
