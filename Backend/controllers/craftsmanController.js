const Craftsman = require("../models/craftsmanModel");
const factory = require("./handlerFactory");
//---------------------------------------------------
let popOptions = [
  {
    path: "specializations",
    select: "name",
  },
  {
    path: "user",
    select: "name profilePicture phoneNumber",
  },
];
const getAllCraftsmen = factory.getAll(Craftsman, popOptions);
const getCraftsman = factory.getOne(Craftsman, popOptions);
const createCraftsman = factory.createOne(Craftsman);
const updateCraftsman = factory.updateOne(Craftsman);
const deleteCraftsman = factory.deleteOne(Craftsman);

module.exports = {
  getAllCraftsmen,
  getCraftsman,
  createCraftsman,
  updateCraftsman,
  deleteCraftsman,
};
