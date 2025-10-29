const mongoose = require("mongoose");
const isValidPhoneNumber = require("../middlewares/validation/isValidPhoneNumber");
const isObject = require("../middlewares/validation/isObject");
const bcrypt = require("bcrypt");

const userSchema = new mongoose.Schema(
  {
    phoneNumber: {
      type: String,
      required: [true, "Please tell us your phone number!"],
      unique: true,
      validate: [isValidPhoneNumber, "Please provide a valid phone number!"],
    },
    name: {
      type: String,
      required: [true, "Please tell us your name!"],
    },
    role: {
      type: String,
      enum: ["client", "craftsman", "admin"],
      required: [true, "Please specify user role!"],
      default: "client",
    },
    profilePicture: {
      type: String,
      default: "default.jpg",
    },

    location: {
      type: Object,
      validate: {
        validator: function (value) {
          return isObject(value);
        },
        message: "Location must be an object!",
      },
      country: {
        type: String,
        default: "Egypt",
        //required: [true, "Please provide your country!"],
      },
      city: {
        type: String,
        default: "Cairo",
        //required: [true, "Please provide your city!"],
      },
      address: {
        type: String,
        //required: [true, "Please provide a address description!"],
      },
    },
    isActive: {
      type: Boolean,
      default: true,
    },
    isVerified: {
      type: Boolean,
      default: false,
    },
    password: {
      type: String,
      select: false,
      minlength: 8,
    },
    refreshToken: {
      type: String,
      select: false,
    },
    refreshTokenExpiresAt: {
      type: Date,
      select: false,
    },
  },
  {
    timestamps: true,
    toJSON: { virtuals: true },
    toObject: { virtuals: true },
  }
);

userSchema.index({ role: 1 });
userSchema.index({ isActive: 1 }); // For filtering active users
userSchema.index({ isVerified: 1 }); // For filtering verified users
userSchema.index({ role: 1, isActive: 1 }); // Compound index for role + active filtering

userSchema.virtual("craftsman", {
  ref: "Craftsman",
  localField: "_id",
  foreignField: "user",
  justOne: true,
});

userSchema.pre(/^find/, function (next) {
  this.select("-__v");
  const options = this.getOptions ? this.getOptions() : {};
  if (!options.includeInactive) {
    this.find({ isActive: { $ne: false } });
  }
  next();
});

// Hash password before saving
userSchema.pre("save", async function (next) {
  if (!this.isModified("password")) return next();
  this.password = await bcrypt.hash(this.password, 12);
  next();
});

// Check if password is correct
userSchema.methods.correctPassword = async function (
  inputPassword,
  userPassword
) {
  return await bcrypt.compare(inputPassword, userPassword);
};

// Hash refresh token before saving
userSchema.pre("save", async function (next) {
  if (!this.refreshToken || !this.isModified("refreshToken")) {
    return next();
  }
  this.refreshToken = await bcrypt.hash(this.refreshToken, 12);
  next();
});

// Check if refresh token is correct
userSchema.methods.correctRefreshToken = async function (
  inputRefreshToken,
  userRefreshToken
) {
  return await bcrypt.compare(inputRefreshToken, userRefreshToken);
};

const User = mongoose.model("User", userSchema);

module.exports = User;
