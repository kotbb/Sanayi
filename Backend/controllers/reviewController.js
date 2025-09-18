const catchAsync = require("../middlewares/catchAsync");
const Review = require("../models/reviewModel");
const AppError = require("../utils/appError");
const factory = require("./handlerFactory");
const Booking = require("../models/bookingModel");

//---------------------------------------------------
let popOptions = [
  {
    path: "craftsman",
    select: "user",
    populate: { path: "user", select: "name phoneNumber" },
  },
  {
    path: "client",
    select: "name phoneNumber",
  },
];

const createBookingReview = catchAsync(async (req, res, next) => {
  const { comment, rating } = req.body;
  const bookingId = req.params.bookingId;
  const clientId = req.user.id;

  const booking = await Booking.findById(bookingId);
  if (!booking) {
    return next(new AppError("This booking does not exist.", 404));
  }
  console.log(booking);

  if (booking.client._id.toString() !== clientId) {
    return next(
      new AppError("You can only write a review for your own bookings.", 403)
    );
  }

  const existingReview = await Review.findOne({ booking: bookingId });
  if (existingReview) {
    return next(
      new AppError("You have already submitted a review for this booking.", 400)
    );
  }

  const newReview = await Review.create({
    comment,
    rating,
    booking: bookingId,
    client: clientId,
    craftsman: booking.craftsman,
  });

  res.status(201).json({
    status: "success",
    data: {
      review: newReview,
    },
  });
});

const getAllReviews = factory.getAll(Review, popOptions);
const getReview = factory.getOne(Review, popOptions);

const getMyReviews = catchAsync(async (req, res, next) => {
  let filter = {};
  let popOptions = {};

  if (req.user.role === "client") {
    filter.client = req.user.id;
    popOptions = {
      path: "craftsman",
      select: "user",
      populate: { path: "user", select: "name phoneNumber" },
    };
  } else if (req.user.role === "craftsman") {
    filter.craftsman = req.craftsman.id;
    popOptions = {
      path: "client",
      select: "name phoneNumber",
    };
  }
  const reviews = await Review.find(filter).populate(popOptions);

  res.status(200).json({
    status: "success",
    results: reviews.length,
    data: {
      reviews,
    },
  });
});

const createReview = factory.createOne(Review);
const updateReview = factory.updateOne(Review);
const deleteReview = factory.deleteOne(Review);

module.exports = {
  createBookingReview,
  getAllReviews,
  getReview,
  getMyReviews,
  createReview,
  updateReview,
  deleteReview,
};
