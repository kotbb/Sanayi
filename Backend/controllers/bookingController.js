const catchAsync = require("../middlewares/catchAsync");
const Booking = require("../models/bookingModel");
const factory = require("./handlerFactory");
const filterObj = require("../utils/filterObject");
const AppError = require("../utils/appError");
//---------------------------------------------------
const popOptions = [
  {
    path: "craftsman",
    select: "user specializations",
    populate: {
      path: "user",
      select: "name profilePicture phoneNumber",
    },
  },
  {
    path: "client",
    select: "name profilePicture phoneNumber",
  },
];

const getAllBookings = factory.getAll(Booking, popOptions);
const getBooking = factory.getOne(Booking, popOptions);
const createBooking = catchAsync(async (req, res, next) => {
  if (req.user.role === "client") {
    if (req.body.client !== req.user.id) {
      return next(
        new AppError("You cannot create bookings for other clients", 400)
      );
    }
  }
  const newBooking = await Booking.create(req.body);
  res.status(201).json({
    status: "success",
    data: { booking: newBooking },
  });
});

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
