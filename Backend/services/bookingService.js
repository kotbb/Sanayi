const Booking = require("../models/bookingModel");
const AppError = require("../utils/appError");
const filterObj = require("../utils/filterObject");

const createBooking = async (bookingData, userId, userRole) => {
  if (userRole === "client") {
    if (bookingData.client !== userId) {
      throw new AppError("You cannot create bookings for other clients", 400);
    }
  }

  const newBooking = await Booking.create(bookingData);
  return newBooking;
};

const updateBooking = async (bookingId, updateData, allowedFields) => {
  const booking = await Booking.findById(bookingId);
  if (!booking) {
    throw new AppError("No booking found with that ID", 404);
  }

  const filteredBody = filterObj(updateData, ...allowedFields);
  Object.assign(booking, filteredBody);

  const updatedBooking = await booking.save();
  return updatedBooking;
};

const deleteBooking = async (bookingId) => {
  const booking = await Booking.findByIdAndDelete(bookingId);
  if (!booking) {
    throw new AppError("No booking found with that ID", 404);
  }
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
