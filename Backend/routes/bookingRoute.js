const express = require("express");
const bookingController = require("../controllers/bookingController");
const protect = require("../middlewares/auth/protect");
const restrictTo = require("../middlewares/auth/restrictTo");
const checkOwnership = require("../middlewares/auth/checkOwnership");
const reviewRoute = require("./reviewRoute");
const Booking = require("../models/bookingModel");
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

module.exports = router;
