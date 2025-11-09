import express from "express";
import userController from "../controllers/userController.js";
import authController from "../controllers/authController.js";
import protect from "../middlewares/auth/protect.js";
import restrictTo from "../middlewares/auth/restrictTo.js";
import bookingRoute from "./bookingRoute.js";
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

export default router;
