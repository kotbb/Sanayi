const Review = require("../models/reviewModel");
const catchAsync = require("../middlewares/catchAsync");
const factory = require("./handlerFactory");
const reviewService = require("../services/reviewService");
const {
  reviewCraftsmanPopOptions,
  reviewClientPopOptions,
  reviewPopOptions,
} = require("../utils/popOptions");

//---------------------------------------------------

const createBookingReview = catchAsync(async (req, res, next) => {
  let newReview;
  if (req.user.role === "admin") {
    // For admin: need to provide craftsmanId, clientId, bookingId in request body
    newReview = await reviewService.createReviewAdmin(req.body);
  } else {
    // For client: bookingId comes from URL params, clientId from authenticated user
    newReview = await reviewService.createReviewClient(
      req.body,
      req.params.bookingId,
      req.user.id
    );
  }

  res.status(201).json({
    status: "success",
    data: {
      review: newReview,
    },
  });
});

const getAllReviews = factory.getAll(Review, reviewPopOptions);
const getReview = factory.getOne(Review, reviewPopOptions);

const getMyReviews = catchAsync(async (req, res, next) => {
  let filter = {};
  let popOptions = {};

  if (req.user.role === "client") {
    filter.client = req.user.id;
    popOptions = reviewCraftsmanPopOptions;
  } else if (req.user.role === "craftsman") {
    filter.craftsman = req.craftsman.id;
    popOptions = reviewClientPopOptions;
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
