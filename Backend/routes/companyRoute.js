const express = require("express");
const companyController = require("../controllers/companyController");
const protect = require("../middlewares/auth/protect");
const restrictTo = require("../middlewares/auth/restrictTo");
const router = express.Router();

router.use(protect);
router
  .route("/")
  .get(companyController.getAllCompanies)
  .post(restrictTo("admin"), companyController.createCompany);

router
  .route("/:id")
  .get(companyController.getCompany)
  .patch(restrictTo("admin"), companyController.updateCompany)
  .delete(restrictTo("admin"), companyController.deleteCompany);

module.exports = router;
