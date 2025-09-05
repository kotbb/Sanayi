const mongoose = require("mongoose");

const reviewSchema = new mongoose.Schema(
  {
    comment: {
      type: String,
      default: "",
    },
    rating: {
      type: Number,
      min: [1, "Rating must be above 1.0"],
      max: [5, "Rating must be below 5.0"],
    },
    craftsman: {
      type: mongoose.Schema.ObjectId,
      ref: "Craftsman",
      required: [true, "Review must belong to a craftsman."],
    },
    client: {
      type: mongoose.Schema.ObjectId,
      ref: "User",
      required: [true, "Review must belong to a client."],
    },
    booking: {
      type: mongoose.Schema.ObjectId,
      ref: "Booking",
      required: [true, "Review must belong to a booking."],
    },
  },
  {
    timestamps: true,
    toJSON: { virtuals: true },
    toObject: { virtuals: true },
  }
);

reviewSchema.pre(/^find/, function (next) {
  this.select("-__v");
  next();
});

reviewSchema.index({ craftsman: 1, createdAt: -1 });

const Review = mongoose.model("Review", reviewSchema);

module.exports = Review;
