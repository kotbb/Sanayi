const catchAsync = require("../catchAsync");
const Craftsman = require("../../models/craftsmanModel");

const loadCraftsmanProfile = catchAsync(async (req, res, next) => {
  if (req.user.role !== "craftsman") {
    return next();
  }

  const craftsman = await Craftsman.findOne({ user: req.user.id });

  req.craftsman = craftsman;
  next();
});

module.exports = loadCraftsmanProfile;
