import express from "express";
import profileController from "../controllers/profileController.js";
import protect from "../middlewares/auth/protect.js";
import restrictTo from "../middlewares/auth/restrictTo.js";
import loadCraftsmanProfile from "../middlewares/auth/loadCraftsmanProfile.js";
import setLoggedId from "../middlewares/auth/setLoggedId.js";
import reviewController from "../controllers/reviewController.js";
import bookingController from "../controllers/bookingController.js";
import {
  uploadUserPhoto,
  resizeUserPhoto,
  uploadPortfolioImages,
  resizePortfolioImages,
} from "../middlewares/uploadMiddleware.js";

const router = express.Router();

router.use(protect);

// --- Profile Management ---
router
  .route("/me")
  .get(restrictTo("client", "craftsman"), profileController.getMe);
router
  .route("/updateMe")
  .patch(
    restrictTo("client", "craftsman"),
    uploadUserPhoto,
    resizeUserPhoto,
    profileController.updateMe
  );
router
  .route("/deleteMe")
  .patch(restrictTo("client", "craftsman"), profileController.deleteMe);

// --- Craftsman-Specific Profile Management ---
router.patch(
  "/craftsman-profile",
  restrictTo("craftsman"),
  loadCraftsmanProfile,
  profileController.updateMyCraftsmanProfile
);
router.patch(
  "/craftsman-portfolio",
  restrictTo("craftsman"),
  uploadPortfolioImages,
  resizePortfolioImages,
  profileController.updateMyPortfolio
);
router.delete(
  "/portfolio/:portfolioId",
  restrictTo("craftsman"),
  profileController.removePortfolioItem
);

// My Reviews
router
  .route("/my-reviews")
  .get(
    restrictTo("client", "craftsman"),
    loadCraftsmanProfile,
    reviewController.getMyReviews
  );

// My Bookings
router
  .route("/my-bookings")
  .get(
    restrictTo("client", "craftsman"),
    loadCraftsmanProfile,
    setLoggedId,
    bookingController.getAllBookings
  );

export default router;
