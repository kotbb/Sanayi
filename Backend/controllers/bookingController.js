const catchAsync = require("../utils/api/catchAsync");
const Booking = require("../models/bookingModel");
const factory = require("./handlerFactory");
const filterObj = require("../utils/filterObject");
//---------------------------------------------------

const getAllBookings = factory.getAll(Booking);
const getBooking = (req, res, next) => {
  res.status(200).json({
    status: "success",
    data: {
      booking: req.doc,
    },
  });
};
const createBooking = factory.createOne(Booking);

const updateBooking = catchAsync(async (req, res, next) => {
  const filteredBody = filterObj(req.body, "status", "date", "time");

  Object.assign(req.doc, filteredBody);

  const updatedBooking = await req.doc.save();

  res.status(200).json({
    status: "success",
    data: {
      booking: updatedBooking,
    },
  });
});

const deleteBooking = catchAsync(async (req, res, next) => {
  await req.doc.deleteOne();
  res.status(204).json({
    status: "success",
    data: null,
  });
});

module.exports = {
  getAllBookings,
  getBooking,
  createBooking,
  updateBooking,
  deleteBooking,
};
