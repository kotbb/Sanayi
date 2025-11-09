import mongoose from "mongoose";

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
  // # for ADMINS only: If includeInactive is true, include inactive categories
  if (this.getOptions() && this.getOptions().includeInactive) {
    return next();
  }
  this.find({ isActive: { $ne: false } });
  next();
});

const Category = mongoose.model("Category", categorySchema);

export default Category;
