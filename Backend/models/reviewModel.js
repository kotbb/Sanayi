import mongoose from "mongoose";
import Craftsman from "./craftsmanModel.js";

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
reviewSchema.index({ client: 1, createdAt: -1 }); // For client reviews
reviewSchema.index({ booking: 1 }); // For booking-specific reviews
reviewSchema.index({ rating: -1 }); // For sorting by rating
reviewSchema.index({ craftsman: 1, rating: -1 }); // Compound: craftsman + rating
reviewSchema.index({ createdAt: -1 }); // For sorting by newest reviews

reviewSchema.statics.calcAverageRatings = async function (craftsmanId) {
  const stats = await this.aggregate([
    {
      $match: { craftsman: craftsmanId },
    },
    {
      $group: {
        _id: "$craftsman",
        numOfRatings: { $sum: 1 },
        avgRating: { $avg: "$rating" },
      },
    },
  ]);
  if (stats.length > 0) {
    await Craftsman.findByIdAndUpdate(
      craftsmanId,
      {
        ratingsQuantity: stats[0].numOfRatings,
        ratingsAverage: stats[0].avgRating,
      },
      {
        new: true,
        runValidators: true,
      }
    );
  }
};

reviewSchema.post("save", function () {
  this.constructor.calcAverageRatings(this.craftsman);
});

reviewSchema.post(/^findOneAnd/, async function (doc) {
  if (doc) {
    await doc.constructor.calcAverageRatings(doc.craftsman);
  }
});

const Review = mongoose.model("Review", reviewSchema);

export default Review;
