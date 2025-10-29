const express = require("express");
const reportController = require("../controllers/reportController");
const protect = require("../middlewares/auth/protect");
const restrictTo = require("../middlewares/auth/restrictTo");

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

module.exports = router;
