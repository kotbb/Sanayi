const express = require("express");
const bookingController = require("../controllers/bookingController");
const authController = require("../controllers/authController");
const reviewRoute = require("./reviewRoute");
const Booking = require("../models/bookingModel");
const router = express.Router({ mergeParams: true });

//------------------------------------------------------
router.use(authController.protect);

router.use("/:bookingId/reviews", reviewRoute);

router
  .route("/")
  .get(bookingController.getAllBookings)
  .post(authController.restrictTo("client"), bookingController.createBooking);

router
  .route("/:id")
  .get(
    authController.checkOwnerShip(Booking, ["client", "craftsman"]),
    bookingController.getBooking
  )
  .patch(
    authController.checkOwnerShip(Booking, ["client", "craftsman"]),
    bookingController.updateBooking
  )
  .delete(
    authController.checkOwnerShip(Booking, ["client", "craftsman"]),
    bookingController.deleteBooking
  );

module.exports = router;
