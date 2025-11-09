import ReportService from "../services/reportService.js";
import catchAsync from "../middlewares/catchAsync.js";
import AppError from "../utils/appError.js";

// Helper function to validate period and timeBack parameters
const validatePeriodAndTimeBack = (period, timeBack) => {
  // Validate period
  if (!["week", "month", "year"].includes(period.toLowerCase())) {
    return {
      isValid: false,
      timeBackNum: null,
      error: new AppError(
        "Invalid period. Use 'week', 'month', or 'year'",
        400
      ),
    };
  }

  // Validate timeBack parameter
  const timeBackNum = parseInt(timeBack);
  let maxValue, errorMessage;

  switch (period.toLowerCase()) {
    case "week":
      maxValue = 52;
      errorMessage = "timeBack must be a number between 1 and 52 for weeks";
      break;
    case "month":
      maxValue = 12;
      errorMessage = "timeBack must be a number between 1 and 12 for months";
      break;
    case "year":
      maxValue = 10;
      errorMessage = "timeBack must be a number between 1 and 10 for years";
      break;
  }

  if (isNaN(timeBackNum) || timeBackNum < 1 || timeBackNum > maxValue) {
    return {
      isValid: false,
      timeBackNum: null,
      error: new AppError(errorMessage, 400),
    };
  }

  return {
    isValid: true,
    timeBackNum,
    error: null,
  };
};

// Get best craftsmen based on rating
const getBestCraftsmen = catchAsync(async (req, res, next) => {
  const { limit = 10 } = req.params;
  const result = await ReportService.getBestCraftsmen(parseInt(limit));

  res.status(200).json({
    status: "success",
    results: result.total,
    data: result.data,
  });
});

// Get user registrations by time period
const getUserRegistrations = catchAsync(async (req, res, next) => {
  const { period = "week" } = req.params;
  const { timeBack = 1 } = req.query;

  // Validate period and timeBack parameters
  const validation = validatePeriodAndTimeBack(period, timeBack);
  if (!validation.isValid) {
    return next(validation.error);
  }

  const result = await ReportService.getUserRegistrations(
    period,
    validation.timeBackNum
  );

  res.status(200).json({
    status: "success",
    data: result.data,
  });
});

// Get total bookings by time period
const getTotalBookings = catchAsync(async (req, res, next) => {
  const { period = "week" } = req.params;
  const { timeBack = 1 } = req.query;

  // Validate period and timeBack parameters
  const validation = validatePeriodAndTimeBack(period, timeBack);
  if (!validation.isValid) {
    return next(validation.error);
  }

  const result = await ReportService.getTotalBookings(
    period,
    validation.timeBackNum
  );

  res.status(200).json({
    status: "success",
    data: result.data,
  });
});

const getDashboardData = catchAsync(async (req, res, next) => {
  const result = await ReportService.getDashboardData();
  res.status(200).json({
    status: "success",
    data: result.data,
  });
});

// Get all reports in one endpoint
const getAllReports = catchAsync(async (req, res, next) => {
  const { limit = 10 } = req.query;

  const [
    bestCraftsmen,
    weeklyUsers,
    monthlyUsers,
    yearlyUsers,
    weeklyBookings,
    monthlyBookings,
    yearlyBookings,
  ] = await Promise.all([
    ReportService.getBestCraftsmen(parseInt(limit)),
    ReportService.getUserRegistrations("week"),
    ReportService.getUserRegistrations("month"),
    ReportService.getUserRegistrations("year"),
    ReportService.getTotalBookings("week"),
    ReportService.getTotalBookings("month"),
    ReportService.getTotalBookings("year"),
  ]);

  res.status(200).json({
    status: "success",
    data: {
      bestCraftsmen: bestCraftsmen.data,
      userRegistrations: {
        week: weeklyUsers.data,
        month: monthlyUsers.data,
        year: yearlyUsers.data,
      },
      bookings: {
        week: weeklyBookings.data,
        month: monthlyBookings.data,
        year: yearlyBookings.data,
      },
    },
  });
});

export default {
  getBestCraftsmen,
  getUserRegistrations,
  getTotalBookings,
  getDashboardData,
  getAllReports,
};
