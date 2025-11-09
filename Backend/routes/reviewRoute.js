import express from "express";
import reviewController from "../controllers/reviewController.js";
import protect from "../middlewares/auth/protect.js";
import restrictTo from "../middlewares/auth/restrictTo.js";
import checkOwnership from "../middlewares/auth/checkOwnership.js";
import Review from "../models/reviewModel.js";
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

export default router;
