import express from "express";
import reportController from "../controllers/reportController.js";
import protect from "../middlewares/auth/protect.js";
import restrictTo from "../middlewares/auth/restrictTo.js";

const router = express.Router();

router.use(protect);
router.use(restrictTo("admin"));

// Get all reports in one endpoint
//router.get("/", reportController.getAllReports);

// Get comprehensive dashboard data
router.get("/dashboard", reportController.getDashboardData);

// Get best craftsmen based on rating
router.get("/best-craftsmen", reportController.getBestCraftsmen);

// Get user registrations by time period
router.get("/users/:period", reportController.getUserRegistrations);

// Get total bookings by time period
router.get("/bookings/:period", reportController.getTotalBookings);

export default router;
