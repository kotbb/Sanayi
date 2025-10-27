const catchAsync = require("../middlewares/catchAsync");
const Craftsman = require("../models/craftsmanModel");
const factory = require("./handlerFactory");
const craftsmanService = require("../services/craftsmanService");
const { craftsmanPopOptions } = require("../utils/popOptions");

//---------------------------------------------------
const getAllCraftsmen = factory.getAll(Craftsman, craftsmanPopOptions);
const getCraftsman = factory.getOne(Craftsman, craftsmanPopOptions);

const createCraftsman = catchAsync(async (req, res, next) => {
  const craftsman = await craftsmanService.createCraftsman(
    req.body,
    req.body.user
  );

  res.status(201).json({
    status: "success",
    data: { craftsman },
  });
});

const updateCraftsman = catchAsync(async (req, res, next) => {
  const craftsman = await craftsmanService.updateCraftsman(
    req.params.id,
    req.body,
    req.user.id
  );

  res.status(200).json({
    status: "success",
    data: { craftsman },
  });
});

const deleteCraftsman = catchAsync(async (req, res, next) => {
  await craftsmanService.deleteCraftsman(req.params.id, req.user.id);

  res.status(204).json({
    status: "success",
    data: null,
  });
});

module.exports = {
  getAllCraftsmen,
  getCraftsman,
  createCraftsman,
  updateCraftsman,
  deleteCraftsman,
};
