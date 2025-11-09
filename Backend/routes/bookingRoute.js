import express from "express";
import bookingController from "../controllers/bookingController.js";
import protect from "../middlewares/auth/protect.js";
import restrictTo from "../middlewares/auth/restrictTo.js";
import checkOwnership from "../middlewares/auth/checkOwnership.js";
import reviewRoute from "./reviewRoute.js";
import Booking from "../models/bookingModel.js";
const router = express.Router({ mergeParams: true });

//------------------------------------------------------
router.use(protect);

router.use("/:bookingId/reviews", reviewRoute);

router
  .route("/")
  .get(restrictTo("admin"), bookingController.getAllBookings)
  .post(restrictTo("client", "admin"), bookingController.createBooking);

router
  .route("/:id")
  .get(
    checkOwnership(Booking, ["client", "craftsman"]),
    bookingController.getBooking
  )
  .patch(
    checkOwnership(Booking, ["client", "craftsman"]),
    bookingController.updateBooking
  )
  .delete(
    checkOwnership(Booking, ["client", "craftsman"]),
    bookingController.deleteBooking
  );

export default router;
