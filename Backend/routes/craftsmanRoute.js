const express = require("express");
const craftsmanController = require("../controllers/craftsmanController");
const authController = require("../controllers/authController");
const reviewRoute = require("./reviewRoute");
const router = express.Router({ mergeParams: true });

//------------------------------------------------------
router.use(authController.protect);

router.use("/:craftsmanId/reviews", reviewRoute);

router
  .route("/")
  .get(craftsmanController.getAllCraftsmen)
  .post(
    authController.restrictTo("admin"),
    craftsmanController.createCraftsman
  );

router
  .route("/:id")
  .get(craftsmanController.getCraftsman)
  .patch(
    authController.restrictTo("admin"),
    craftsmanController.updateCraftsman
  )
  .delete(
    authController.restrictTo("admin"),
    craftsmanController.deleteCraftsman
  );

module.exports = router;
