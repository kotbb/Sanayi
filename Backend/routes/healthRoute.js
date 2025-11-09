import express from "express";
import healthController from "../controllers/healthController.js";

const router = express.Router();

// Root health check
router.route("/").get(healthController.getRootHealth);

// API health check
router.route("/api").get(healthController.getApiHealth);

export default router;
