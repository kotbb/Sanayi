import Company from "../models/companyModel.js";
import factory from "./handlerFactory.js";

const createCompany = factory.createOne(Company);
const getAllCompanies = factory.getAll(Company);
const getCompany = factory.getOne(Company);
const updateCompany = factory.updateOne(Company);
const deleteCompany = factory.deleteOne(Company);

export default {
  createCompany,
  getAllCompanies,
  getCompany,
  updateCompany,
  deleteCompany,
};
