const Booking = require("../models/bookingModel");
const AppError = require("../utils/appError");
const filterObj = require("../utils/filterObject");

const createBooking = async (bookingData) => {
  const newBooking = await Booking.create(bookingData);
  return newBooking;
};

const updateBooking = async (booking, updateData, allowedFields) => {
  const filteredBody = filterObj(updateData, ...allowedFields);
  Object.assign(booking, filteredBody);

  const updatedBooking = await booking.save();
  return updatedBooking;
};

const deleteBooking = async (booking) => {
  await booking.deleteOne();
  return booking;
};

const getBookingById = async (bookingId, popOptions) => {
  let query = Booking.findById(bookingId);
  if (popOptions) query = query.populate(popOptions);

  const booking = await query;
  if (!booking) {
    throw new AppError("No booking found with that ID", 404);
  }

  return booking;
};

const getAllBookings = async (filter = {}, popOptions) => {
  let query = Booking.find(filter);
  if (popOptions) query = query.populate(popOptions);

  const bookings = await query;
  return bookings;
};

const getBookingsByClient = async (clientId, popOptions) => {
  return getAllBookings({ client: clientId }, popOptions);
};

const getBookingsByCraftsman = async (craftsmanId, popOptions) => {
  return getAllBookings({ craftsman: craftsmanId }, popOptions);
};

module.exports = {
  createBooking,
  updateBooking,
  deleteBooking,
  getBookingById,
  getAllBookings,
  getBookingsByClient,
  getBookingsByCraftsman,
};
