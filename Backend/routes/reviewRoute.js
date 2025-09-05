const express = require("express");
const reviewController = require("../controllers/reviewController");
const authController = require("../controllers/authController");
const Review = require("../models/reviewModel");
const router = express.Router({ mergeParams: true });

//------------------------------------------------------

router.use(authController.protect);

router
  .route("/")
  .get(reviewController.getAllReviews)
  .post(
    authController.restrictTo("client"),
    reviewController.createBookingReview
  );

router
  .route("/:id")
  .get(reviewController.getReview)
  .patch(
    authController.checkOwnerShip(Review, ["client"]),
    reviewController.updateReview
  )
  .delete(
    authController.checkOwnerShip(Review, ["client"]),
    reviewController.deleteReview
  );

module.exports = router;
