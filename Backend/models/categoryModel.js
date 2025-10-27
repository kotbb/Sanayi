const mongoose = require("mongoose");

const categorySchema = new mongoose.Schema(
  {
    name: {
      type: String,
      required: true,
      unique: true,
    },
    iconUrl: {
      type: String,
      default: "defaultCategory.jpg",
    },
    isActive: {
      type: Boolean,
      default: true,
    },
  },
  {
    timestamps: true,
    toJSON: { virtuals: true },
    toObject: { virtuals: true },
  }
);

categorySchema.index({ isActive: 1 }); // For filtering active categories

categorySchema.pre(/^find/, function (next) {
  this.select("-__v");
  this.find({ isActive: { $ne: false } });
  next();
});

const Category = mongoose.model("Category", categorySchema);

module.exports = Category;
