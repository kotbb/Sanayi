const express = require("express");
const categoryController = require("../controllers/categoryController");
const authController = require("../controllers/authController");
const craftsmanRoute = require("./craftsmanRoute");
const router = express.Router();

//------------------------------------------------------
router.use(authController.protect);

router.use("/:categoryId/craftsmen", craftsmanRoute);

router
  .route("/")
  .get(categoryController.getAllCategories)
  .post(authController.restrictTo("admin"), categoryController.createCategory);

router
  .route("/:id")
  .get(categoryController.getCategory)
  .patch(authController.restrictTo("admin"), categoryController.updateCategory)
  .delete(
    authController.restrictTo("admin"),
    categoryController.deleteCategory
  );

module.exports = router;
