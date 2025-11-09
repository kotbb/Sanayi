import express from "express";
import craftsmanController from "../controllers/craftsmanController.js";
import protect from "../middlewares/auth/protect.js";
import restrictTo from "../middlewares/auth/restrictTo.js";
import reviewRoute from "./reviewRoute.js";
const router = express.Router({ mergeParams: true });

//------------------------------------------------------
router.use(protect);

router.use("/:craftsmanId/reviews", reviewRoute);

router
  .route("/")
  .get(craftsmanController.getAllCraftsmen)
  .post(restrictTo("craftsman", "admin"), craftsmanController.createCraftsman);

router
  .route("/:id")
  .get(craftsmanController.getCraftsman)
  .patch(restrictTo("craftsman", "admin"), craftsmanController.updateCraftsman)
  .delete(
    restrictTo("craftsman", "admin"),
    craftsmanController.deleteCraftsman
  );

export default router;
