import express from "express";
import companyController from "../controllers/companyController.js";
import protect from "../middlewares/auth/protect.js";
import restrictTo from "../middlewares/auth/restrictTo.js";
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

export default router;
