import catchAsync from "../catchAsync.js";
import AppError from "../../utils/appError.js";
import Craftsman from "../../models/craftsmanModel.js";

const checkOwnerShip = (Model, userFieldNames) => {
  return catchAsync(async (req, res, next) => {
    const doc = await Model.findById(req.params.id);
    if (!doc) {
      return next(new AppError("No document found with that ID", 404));
    }

    // Check if the document belongs to the admin
    if (req.user.role === "admin") {
      req.doc = doc;
      return next();
    }
    let isOwner = false;
    if (req.user.role === "craftsman" && userFieldNames.includes("craftsman")) {
      const craftsman = await Craftsman.findOne({ user: req.user.id });
      isOwner = doc.craftsman?.toString() === craftsman.id;
    } else {
      isOwner = doc.client?.toString() === req.user.id;
    }
    if (!isOwner) {
      return next(
        new AppError("You do not have permission to perform this action", 403)
      );
    }

    req.doc = doc;
    next();
  });
};

export default checkOwnerShip;
