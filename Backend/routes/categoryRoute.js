const express = require("express");
const categoryController = require("../controllers/categoryController");
const protect = require("../middlewares/auth/protect");
const restrictTo = require("../middlewares/auth/restrictTo");
const craftsmanRoute = require("./craftsmanRoute");
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

module.exports = router;
