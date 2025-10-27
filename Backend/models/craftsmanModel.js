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
craftsmanSchema.index({ user: 1 });
craftsmanSchema.index({ ratingsAverage: -1 }); // For sorting by rating (descending)
craftsmanSchema.index({ ratingsQuantity: -1 }); // For sorting by number of reviews
craftsmanSchema.index({ specializations: 1, ratingsAverage: -1 }); // Compound: category + rating
craftsmanSchema.index({ specializations: 1, hourlyRate: 1 }); // Compound: category + price
craftsmanSchema.index({ createdAt: -1 }); // For sorting by newest craftsmen

craftsmanSchema.pre(/^find/, function (next) {
  this.select("-__v");
  const selectOptions = this.getOptions().select;
  if (selectOptions && selectOptions.includes("-specializations")) {
    return next();
  }
  this.populate({ path: "specializations", select: "name" });
  next();
});

// Simple post-hook to filter out craftsmen with null users
craftsmanSchema.post(/^find/, function (docs, next) {
  if (Array.isArray(docs)) {
    const filteredDocs = docs.filter((doc) => doc.user !== null);
    docs.splice(0, docs.length, ...filteredDocs);
  } else if (docs && docs.user === null) {
    docs = null;
  }
  next();
});

// Pre-save validation to ensure user exists and has craftsman role
craftsmanSchema.pre("save", async function (next) {
  if (this.isNew) {
    const user = await User.findById(this.user);
    if (!user) {
      return next(new Error("User not found"));
    }
    if (user.role !== "craftsman") {
      return next(new Error("User must have craftsman role"));
    }
  }
  next();
});

// Pre-findOneAndUpdate validation
craftsmanSchema.pre("findOneAndUpdate", async function (next) {
  const update = this.getUpdate();
  if (update.user) {
    const user = await User.findById(update.user);
    if (!user) {
      return next(new Error("User not found"));
    }
    if (user.role !== "craftsman") {
      return next(new Error("User must have craftsman role"));
    }
  }
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

const Craftsman = mongoose.model("Craftsman", craftsmanSchema);

module.exports = Craftsman;
