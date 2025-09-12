const express = require("express");
const userController = require("../controllers/userController");
const authController = require("../controllers/authController");
const reviewController = require("../controllers/reviewController");
const bookingController = require("../controllers/bookingController");
const bookingRoute = require("./bookingRoute");
const router = express.Router();

// User profile routes
router.use(authController.protect);

router
  .route("/me")
  .get(
    authController.restrictTo("client", "craftsman"),
    userController.getMe,
    userController.getUser
  );
router
  .route("/me/reviews")
  .get(
    authController.restrictTo("client", "craftsman"),
    authController.loadCraftsmanProfile,
    reviewController.getMyReviews
  );

router
  .route("/me/bookings")
  .get(
    authController.restrictTo("client", "craftsman"),
    authController.loadCraftsmanProfile,
    authController.setLoggedId,
    bookingController.getAllBookings
  );
router
  .route("/updateMe")
  .patch(
    authController.restrictTo("client", "craftsman"),
    userController.updateMe
  );
router
  .route("/deleteMe")
  .patch(
    authController.restrictTo("client", "craftsman"),
    userController.deleteMe
  );

router.route("/update-phone/send-otp").post(userController.sendUpdatePhoneOTP);
router
  .route("/update-phone/verify-otp")
  .patch(userController.verifyUpdatePhoneOTP);

router.use("/:clientId/bookings", bookingRoute);

//--- Admin Routes ---
router.use(authController.restrictTo("admin"));
router
  .route("/")
  .get(userController.getAllUsers)
  .post(userController.createUser);
router
  .route("/:id")
  .get(userController.getUser)
  .patch(userController.updateUser)
  .delete(userController.deleteUser);

//------------------------------------------------------

module.exports = router;
