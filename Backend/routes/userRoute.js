const express = require("express");
const userController = require("../controllers/userController");
const authController = require("../controllers/authController");
const protect = require("../middlewares/auth/protect");
const restrictTo = require("../middlewares/auth/restrictTo");
const bookingRoute = require("./bookingRoute");
const router = express.Router();

router.use("/:clientId/bookings", bookingRoute);

// Phone Update
router.route("/update-phone/send-otp").post(userController.sendUpdatePhoneOTP);
router
  .route("/update-phone/verify-otp")
  .patch(userController.verifyUpdatePhoneOTP);

router.use(protect);
router.route("/:id").get(userController.getUser);

//--- Admin Routes ---
router.use(restrictTo("admin"));
router
  .route("/")
  .get(userController.getAllUsers)
  .post(userController.createUser);
router
  .route("/:id")
  .patch(userController.updateUser)
  .delete(userController.deleteUser);

//------------------------------------------------------

module.exports = router;
