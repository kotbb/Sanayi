const catchAsync = require("../utils/api/catchAsync");
const AppError = require("../utils/appError");
const APIFeatures = require("../utils/api/apiFeatures");
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
    const doc = await Model.findByIdAndUpdate(req.params.id, req.body, {
      new: true,
      runValidators: true,
    });
    if (!doc) {
      return next(new AppError("No document found with that ID", 404));
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
    const doc = await Model.findByIdAndDelete(req.params.id);
    if (!doc) {
      return next(new AppError("No document found with that ID", 404));
    }
    res.status(204).json({
      status: "success",
      data: null,
    });
  });

const getOne = (Model, popOptions) =>
  catchAsync(async (req, res, next) => {
    let query = Model.findById(req.params.id);
    if (popOptions) query = query.populate(popOptions);
    const doc = await query;

    if (!doc) {
      return next(new AppError("No document found with that ID", 404));
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
    // to allow for nested routes

    let filter = {};
    if (req.user.role !== "admin") {
      if (req.params.clientId) filter.client = req.params.clientId;
      if (req.params.craftsmanId) filter.craftsman = req.params.craftsmanId;
      if (req.params.bookingId) filter.booking = req.params.bookingId;
      if (req.params.categoryId) {
        filter.specializations = { $in: [req.params.categoryId] };
      }
    }

    console.log(filter);
    let query = Model.find(filter);
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
