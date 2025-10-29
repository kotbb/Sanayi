const express = require("express");
const reviewController = require("../controllers/reviewController");
const protect = require("../middlewares/auth/protect");
const restrictTo = require("../middlewares/auth/restrictTo");
const checkOwnership = require("../middlewares/auth/checkOwnership");
const Review = require("../models/reviewModel");
const router = express.Router({ mergeParams: true });

//------------------------------------------------------

router.use(protect);

router
  .route("/")
  .get(reviewController.getAllReviews)
  .post(restrictTo("client", "admin"), reviewController.createBookingReview);

router
  .route("/:id")
  .get(reviewController.getReview)
  .patch(checkOwnership(Review, ["client"]), reviewController.updateReview)
  .delete(checkOwnership(Review, ["client"]), reviewController.deleteReview);

module.exports = router;
