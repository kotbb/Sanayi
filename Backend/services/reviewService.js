const Review = require("../models/reviewModel");
const Booking = require("../models/bookingModel");
const AppError = require("../utils/appError");

const createReviewAdmin = async (reviewData) => {
  const { craftsmanId, clientId, bookingId, rating, comment } = reviewData;

  const booking = await Booking.findById(bookingId);
  if (!booking) {
    throw new AppError("This booking does not exist.", 404);
  }
  if (booking.client._id.toString() !== clientId) {
    throw new AppError("This client is not associated with this booking.", 403);
  }
  if (booking.craftsman._id.toString() !== craftsmanId) {
    throw new AppError(
      "This craftsman is not associated with this booking.",
      403
    );
  }
  const existingReview = await Review.findOne({ booking: bookingId });
  if (existingReview) {
    throw new AppError(
      "You have already submitted a review for this booking.",
      400
    );
  }
  const newReview = await Review.create({
    comment,
    rating,
    booking: bookingId,
    client: clientId,
    craftsman: craftsmanId,
  });
  return newReview;
};

const createReviewClient = async (reviewData, bookingId, clientId) => {
  const { comment, rating } = reviewData;

  const booking = await Booking.findById(bookingId);
  if (!booking) {
    throw new AppError("This booking does not exist.", 404);
  }

  if (booking.client._id.toString() !== clientId) {
    throw new AppError(
      "You can only write a review for your own bookings.",
      403
    );
  }

  const existingReview = await Review.findOne({ booking: bookingId });
  if (existingReview) {
    throw new AppError(
      "You have already submitted a review for this booking.",
      400
    );
  }

  const newReview = await Review.create({
    comment,
    rating,
    booking: bookingId,
    client: clientId,
    craftsman: booking.craftsman,
  });

  return newReview;
};

const getReviewById = async (reviewId, popOptions) => {
  let query = Review.findById(reviewId);
  if (popOptions) query = query.populate(popOptions);

  const review = await query;
  if (!review) {
    throw new AppError("No review found with that ID", 404);
  }

  return review;
};

const getAllReviews = async (filter = {}, popOptions) => {
  let query = Review.find(filter);
  if (popOptions) query = query.populate(popOptions);

  const reviews = await query;
  return reviews;
};

const getReviewsByCraftsman = async (craftsmanId, popOptions) => {
  return getAllReviews({ craftsman: craftsmanId }, popOptions);
};

const getReviewsByClient = async (clientId, popOptions) => {
  return getAllReviews({ client: clientId }, popOptions);
};

const updateReview = async (reviewId, updateData) => {
  const review = await Review.findByIdAndUpdate(reviewId, updateData, {
    new: true,
    runValidators: true,
  });

  if (!review) {
    throw new AppError("No review found with that ID", 404);
  }

  return review;
};

const deleteReview = async (reviewId) => {
  const review = await Review.findByIdAndDelete(reviewId);
  if (!review) {
    throw new AppError("No review found with that ID", 404);
  }

  return review;
};

module.exports = {
  createReviewAdmin,
  createReviewClient,
  getReviewById,
  getAllReviews,
  getReviewsByCraftsman,
  getReviewsByClient,
  updateReview,
  deleteReview,
};
