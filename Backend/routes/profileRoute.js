const express = require("express");
const profileController = require("../controllers/profileController");
const protect = require("../middlewares/auth/protect");
const restrictTo = require("../middlewares/auth/restrictTo");
const loadCraftsmanProfile = require("../middlewares/auth/loadCraftsmanProfile");
const setLoggedId = require("../middlewares/auth/setLoggedId");
const reviewController = require("../controllers/reviewController");
const bookingController = require("../controllers/bookingController");
const {
  uploadUserPhoto,
  resizeUserPhoto,
  uploadPortfolioImages,
  resizePortfolioImages,
} = require("../middlewares/uploadMiddleware");

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

module.exports = router;
