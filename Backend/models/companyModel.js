const mongoose = require("mongoose");
const companySchema = new mongoose.Schema({
  name: {
    type: String,
    required: true,
    unique: true,
  },
  address: {
    type: String,
  },
  phoneNumber: {
    type: String,
    required: true,
    unique: true,
  },
  email: {
    type: String,
    required: true,
    unique: true,
  },
  website: {
    type: String,
  },
  logo: {
    type: String,
    default: "default.jpg",
  },
  description: {
    type: String,
  },
  isActive: {
    type: Boolean,
    default: true,
  },
});

companySchema.index({ isActive: 1 }); // For filtering active companies

const Company = mongoose.model("Company", companySchema);

module.exports = Company;
