const mongoose = require("mongoose");
const User = require("./userModel");

const portfolioSchema = new mongoose.Schema({
  title: {
    type: String,
    //required: true,
  },
  description: {
    type: String,
    //required: true,
  },
  images: [
    {
      type: String,
      required: true,
    },
  ],
});

const workScheduleSchema = new mongoose.Schema({
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
});

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
    workSchedule: [workScheduleSchema],
    portfolio: [portfolioSchema],
    hourlyRate: {
      type: Number,
      //required: true,
      default: 0,
      min: [0, "Hourly rate cannot be negative"],
    },
    ratingsAverage: {
      type: Number,
      default: 0,
      min: [0, "Rating must be above 0"],
      max: [5, "Rating must be below 5.0"],
      set: (val) => Math.round(val * 10) / 10,
    },
    ratingsQuantity: {
      type: Number,
      default: 0,
    },
  },
  {
    timestamps: true,
    toJSON: { virtuals: true },
    toObject: { virtuals: true },
  }
);

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

craftsmanSchema.index({ user: 1 });

const Craftsman = mongoose.model("Craftsman", craftsmanSchema);

module.exports = Craftsman;
