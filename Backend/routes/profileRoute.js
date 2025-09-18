const express = require("express");
const profileController = require("../controllers/profileController");
const authController = require("../controllers/authController");
const reviewController = require("../controllers/reviewController");
const bookingController = require("../controllers/bookingController");
const {
  uploadUserPhoto,
  resizeUserPhoto,
  uploadPortfolioImages,
  resizePortfolioImages,
} = require("../middlewares/uploadMiddleware");

const router = express.Router();

router.use(authController.protect);

// --- Profile Management ---
router
  .route("/me")
  .get(
    authController.restrictTo("client", "craftsman"),
    profileController.getMe
  );
router
  .route("/updateMe")
  .patch(
    authController.restrictTo("client", "craftsman"),
    uploadUserPhoto,
    resizeUserPhoto,
    profileController.updateMe
  );
router
  .route("/deleteMe")
  .patch(
    authController.restrictTo("client", "craftsman"),
    profileController.deleteMe
  );

// --- Craftsman-Specific Profile Management ---
router.patch(
  "/craftsman-profile",
  authController.restrictTo("craftsman"),
  authController.loadCraftsmanProfile,
  profileController.updateMyCraftsmanProfile
);
router.patch(
  "/craftsman-portfolio",
  authController.restrictTo("craftsman"),
  uploadPortfolioImages,
  resizePortfolioImages,
  profileController.updateMyPortfolio
);
router.delete(
  "/portfolio/:portfolioId",
  authController.restrictTo("craftsman"),
  profileController.removePortfolioItem
);

// My Reviews
router
  .route("/my-reviews")
  .get(
    authController.restrictTo("client", "craftsman"),
    authController.loadCraftsmanProfile,
    reviewController.getMyReviews
  );

// My Bookings
router
  .route("/my-bookings")
  .get(
    authController.restrictTo("client", "craftsman"),
    authController.loadCraftsmanProfile,
    authController.setLoggedId,
    bookingController.getAllBookings
  );

module.exports = router;
