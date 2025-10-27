const express = require("express");
const craftsmanController = require("../controllers/craftsmanController");
const protect = require("../middlewares/auth/protect");
const restrictTo = require("../middlewares/auth/restrictTo");
const reviewRoute = require("./reviewRoute");
const router = express.Router({ mergeParams: true });

//------------------------------------------------------
router.use(protect);

router.use("/:craftsmanId/reviews", reviewRoute);

router
  .route("/")
  .get(craftsmanController.getAllCraftsmen)
  .post(restrictTo("craftsman", "admin"), craftsmanController.createCraftsman);

router
  .route("/:id")
  .get(craftsmanController.getCraftsman)
  .patch(restrictTo("craftsman", "admin"), craftsmanController.updateCraftsman)
  .delete(
    restrictTo("craftsman", "admin"),
    craftsmanController.deleteCraftsman
  );

module.exports = router;
