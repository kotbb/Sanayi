import catchAsync from "../catchAsync.js";
import Craftsman from "../../models/craftsmanModel.js";

const loadCraftsmanProfile = catchAsync(async (req, res, next) => {
  if (req.user.role !== "craftsman") {
    return next();
  }

  const craftsman = await Craftsman.findOne({ user: req.user.id });

  req.craftsman = craftsman;
  next();
});

export default loadCraftsmanProfile;
