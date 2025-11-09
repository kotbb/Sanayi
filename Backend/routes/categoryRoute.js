import express from "express";
import categoryController from "../controllers/categoryController.js";
import protect from "../middlewares/auth/protect.js";
import restrictTo from "../middlewares/auth/restrictTo.js";
import craftsmanRoute from "./craftsmanRoute.js";
const router = express.Router();

//------------------------------------------------------
router.use(protect);

router.use("/:categoryId/craftsmen", craftsmanRoute);

router
  .route("/")
  .get(categoryController.getAllCategories)
  .post(restrictTo("admin"), categoryController.createCategory);

router
  .route("/:id")
  .get(categoryController.getCategory)
  .patch(restrictTo("admin"), categoryController.updateCategory)
  .delete(restrictTo("admin"), categoryController.deleteCategory);

export default router;
