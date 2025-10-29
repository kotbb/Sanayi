const catchAsync = require("../middlewares/catchAsync");
const AppError = require("../utils/appError");
const APIFeatures = require("../middlewares/apiFeatures");
//---------------------------------------------------

const createOne = (Model) =>
  catchAsync(async (req, res, next) => {
    const newDoc = await Model.create(req.body);
    res.status(201).json({
      status: "success",
      data: {
        [Model.modelName.toLowerCase()]: newDoc,
      },
    });
  });

const updateOne = (Model) =>
  catchAsync(async (req, res, next) => {
    let doc;

    // Use req.doc if available (from checkOwnership middleware), otherwise fetch
    if (req.doc) {
      Object.assign(req.doc, req.body);
      doc = await req.doc.save();
    } else {
      doc = await Model.findByIdAndUpdate(req.params.id, req.body, {
        new: true,
        runValidators: true,
      });
      if (!doc) {
        return next(new AppError("No document found with that ID", 404));
      }
    }

    res.status(200).json({
      status: "success",
      data: {
        [Model.modelName.toLowerCase()]: doc,
      },
    });
  });

const deleteOne = (Model) =>
  catchAsync(async (req, res, next) => {
    // Use req.doc if available (from checkOwnership middleware), otherwise fetch
    if (req.doc) {
      await req.doc.deleteOne();
    } else {
      const doc = await Model.findByIdAndDelete(req.params.id);
      if (!doc) {
        return next(new AppError("No document found with that ID", 404));
      }
    }

    res.status(204).json({
      status: "success",
      data: null,
    });
  });

const getOne = (Model, popOptions) =>
  catchAsync(async (req, res, next) => {
    let doc;

    // Use req.doc if available (from checkOwnership middleware), otherwise fetch
    if (req.doc) {
      doc = req.doc;
      // Apply population if needed
      if (popOptions) {
        doc = await Model.findById(doc._id).populate(popOptions);
      }
    } else {
      let query = Model.findById(req.params.id);

      // If requesting Users or Craftsmen and requester is admin, include inactive users or craftsmen as well
      if (
        (Model.modelName === "User" || Model.modelName === "Craftsman") &&
        req.user &&
        req.user.role === "admin"
      ) {
        query = query.setOptions({ includeInactive: true });
      }
      if (popOptions) query = query.populate(popOptions);
      doc = await query;

      if (!doc) {
        return next(new AppError("No document found with that ID", 404));
      }
    }

    res.status(200).json({
      status: "success",
      data: {
        [Model.modelName.toLowerCase()]: doc,
      },
    });
  });

const getAll = (Model, popOptions) =>
  catchAsync(async (req, res, next) => {
    let filter = {};

    // Filtering by client, craftsman, booking, category
    if (req.params.clientId) filter.client = req.params.clientId;
    if (req.params.craftsmanId) filter.craftsman = req.params.craftsmanId;
    if (req.params.bookingId) filter.booking = req.params.bookingId;
    if (req.params.categoryId) {
      filter.specializations = { $in: [req.params.categoryId] };
    }

    let query = Model.find(filter);
    // If requesting Users or Craftsmen and requester is admin, include inactive users or craftsmen as well
    if (req.user && req.user.role === "admin") {
      query = query.setOptions({ includeInactive: true });
    }
    if (popOptions) query = query.populate(popOptions);

    // BUILD QUERY
    const features = new APIFeatures(query, req.query)
      .filter()
      .sort()
      .limitFields()
      .paginate();

    // EXECUTE QUERY
    const docs = await features.query;

    res.status(200).json({
      status: "success",
      results: docs.length,
      data: {
        data: docs,
      },
    });
  });

module.exports = {
  createOne,
  getOne,
  getAll,
  updateOne,
  deleteOne,
};
