const mongoose = require("mongoose");
const Craftsman = require("./craftsmanModel");

const bookingSchema = new mongoose.Schema({
  client: {
    type: mongoose.Schema.ObjectId,
    ref: "User",
    required: [true, "Booking must belong to a client."],
  },
  craftsman: {
    type: mongoose.Schema.ObjectId,
    ref: "Craftsman",
    required: [true, "Booking must belong to a craftsman."],
  },
  date: {
    type: Date,
    required: [true, "Booking must have a date."],
    default: Date.now,
  },
  time: {
    type: String,
    required: [true, "Booking must have a time."],
    default: "09:00",
  },
  status: {
    type: String,
    enum: ["pending", "confirmed", "completed", "cancelled"],
    default: "pending",
  },
});

bookingSchema.index({ craftsman: 1, date: -1 });
bookingSchema.index({ client: 1, date: -1 });

bookingSchema.pre("save", async function (next) {
  if (this.isModified("craftsman")) {
    const craftsman = await Craftsman.findById(this.craftsman);
    if (!craftsman) {
      return next(
        new Error("Invalid craftsman reference. The craftsman does not exist.")
      );
    }
  }
  next();
});

bookingSchema.virtual("reviews", {
  ref: "Review",
  foreignField: "booking",
  localField: "_id",
});

bookingSchema.pre(/^find/, function (next) {
  this.populate({
    path: "craftsman",
    select: "user specializations hourlyRate",
    populate: {
      path: "user",
      select: "name profilePicture phoneNumber",
    },
  });
  this.populate({
    path: "client",
    select: "name profilePicture phoneNumber",
  });
  this.populate({
    path: "reviews",
    select: "rating comment",
  });
  this.select("-__v");
  next();
});

const Booking = mongoose.model("Booking", bookingSchema);

module.exports = Booking;
