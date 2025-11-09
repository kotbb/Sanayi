import catchAsync from "../middlewares/catchAsync.js";
import Booking from "../models/bookingModel.js";
import factory from "./handlerFactory.js";
import bookingService from "../services/bookingService.js";
import { bookingPopOptions } from "../utils/popOptions.js";
//---------------------------------------------------

/* Note: All the endpoints are protected by the checkOwnership middleware (update, delete, getById) 
    which sets the req.doc object. So, we don't need to fetch the document from the database again.
*/

// Get all bookings
const getAllBookings = factory.getAll(Booking, bookingPopOptions);
// Get a booking
const getBooking = factory.getOne(Booking, bookingPopOptions);

// Create a booking
const createBooking = catchAsync(async (req, res, next) => {
  const newBooking = await bookingService.createBooking(req.body);
  res.status(201).json({
    status: "success",
    data: { booking: newBooking },
  });
});

// Update a booking
const updateBooking = catchAsync(async (req, res, next) => {
  const allowedFields = ["status", "date", "time"];
  const updatedBooking = await bookingService.updateBooking(
    req.doc,
    req.body,
    allowedFields
  );

  res.status(200).json({
    status: "success",
    data: {
      booking: updatedBooking,
    },
  });
});

// Delete a booking
const deleteBooking = catchAsync(async (req, res, next) => {
  await bookingService.deleteBooking(req.doc);
  res.status(204).json({
    status: "success",
    data: null,
  });
});

export default {
  getAllBookings,
  getBooking,
  createBooking,
  updateBooking,
  deleteBooking,
};
