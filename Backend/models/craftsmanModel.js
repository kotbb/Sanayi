const mongoose = require("mongoose");
const isObject = require("../utils/validators/isObject");
const User = require("./userModel");

const craftsmanSchema = new mongoose.Schema(
  {
    specializations: [
      {
        type: mongoose.Schema.ObjectId,
        ref: "Category",
        required: true,
      },
    ],
    user: {
      type: mongoose.Schema.ObjectId,
      ref: "User",
      required: true,
    },
    workSchedule: [
      {
        type: Object,
        validate: {
          validator: function (value) {
            return isObject(value);
          },
        },
        day: {
          type: String,
          enum: [
            "saturday",
            "sunday",
            "monday",
            "tuesday",
            "wednesday",
            "thursday",
            "friday",
          ],
          required: true,
        },
        available: {
          type: Boolean,
          default: true,
        },
        startTime: {
          type: String,
          required: function () {
            return this.available;
          },
        },
        endTime: {
          type: String,
          required: function () {
            return this.available;
          },
        },
      },
    ],
    portfolio: [
      {
        type: Object,
        validate: {
          validator: function (value) {
            return isObject(value);
          },
        },
        title: {
          type: String,
          required: true,
        },
        description: {
          type: String,
          required: true,
        },
        images: [
          {
            type: String,
            required: true,
          },
        ],
      },
    ],
    hourlyRate: {
      type: Number,
      //required: true,
      default: 0,
      min: [0, "Hourly rate cannot be negative"],
    },
  },
  {
    timestamps: true,
    toJSON: { virtuals: true },
    toObject: { virtuals: true },
  }
);

craftsmanSchema.index({ user: 1 });
craftsmanSchema.index({ specializations: 1 });
craftsmanSchema.index({ hourlyRate: 1 });

craftsmanSchema.pre(/^find/, function (next) {
  this.select("-__v");
  this.populate({ path: "specializations", select: "name" });
  next();
});

craftsmanSchema.pre("findOneAndDelete", async function (next) {
  try {
    const craftsman = await this.model.findOne(this.getFilter());
    if (craftsman && craftsman.user) {
      await User.findByIdAndDelete(craftsman.user);
    }
    next();
  } catch (err) {
    next(err);
  }
});

craftsmanSchema.virtual("averageRating").get(function () {
  if (!this.reviews || this.reviews.length === 0) return 0;
  return (
    this.reviews.reduce((sum, review) => sum + review.rating, 0) /
    this.reviews.length
  );
});

// We need to see if the isActive will work

craftsmanSchema.index({ user: 1 });

const Craftsman = mongoose.model("Craftsman", craftsmanSchema);

module.exports = Craftsman;
