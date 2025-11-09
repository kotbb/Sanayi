import User from "../models/userModel.js";
import Craftsman from "../models/craftsmanModel.js";
import Booking from "../models/bookingModel.js";
import Review from "../models/reviewModel.js";
import { formatDateRange } from "../utils/dateFormatter.js";

class ReportService {
  // Get best craftsmen based on rating
  static async getBestCraftsmen(limit = 5) {
    try {
      const craftsmen = await Craftsman.find({
        ratingsQuantity: { $gt: 0 }, // Only craftsmen with reviews
      })
        .populate({
          path: "user",
          select: "name phoneNumber location",
        })
        .populate({
          path: "specializations",
          select: "name",
        })
        .sort({ ratingsAverage: -1, ratingsQuantity: -1 })
        .limit(limit);

      return {
        success: true,
        data: craftsmen,
        total: craftsmen.length,
      };
    } catch (error) {
      throw new Error(`Failed to get best craftsmen: ${error.message}`);
    }
  }

  // Get user registrations by time period
  static async getUserRegistrations(period = "week", timeBack = 1) {
    try {
      const now = new Date();
      let startDate;

      switch (period.toLowerCase()) {
        case "week":
          startDate = new Date(
            now.getTime() - timeBack * 7 * 24 * 60 * 60 * 1000
          );
          break;
        case "month":
          startDate = new Date(now.getFullYear(), now.getMonth() - timeBack, 1);
          break;
        case "year":
          startDate = new Date(now.getFullYear() - timeBack, 0, 1);
          break;
        default:
          throw new Error("Invalid period. Use 'week', 'month', or 'year'");
      }

      // Get only counts, not the actual data
      const totalUsers = await User.countDocuments({
        createdAt: { $gte: startDate, $lte: now },
      });

      // Get role breakdown using aggregation
      const roleStats = await User.aggregate([
        {
          $match: {
            createdAt: { $gte: startDate, $lte: now },
          },
        },
        {
          $group: {
            _id: "$role",
            count: { $sum: 1 },
          },
        },
      ]);

      // Convert aggregation result to object format
      const roleBreakdown = roleStats.reduce((acc, item) => {
        acc[item._id] = item.count;
        return acc;
      }, {});

      const dateRange = formatDateRange(startDate, now);

      return {
        success: true,
        data: {
          period,
          timeBack,
          startDate: dateRange.startDate,
          endDate: dateRange.endDate,
          startDateISO: dateRange.startDateISO,
          endDateISO: dateRange.endDateISO,
          totalUsers,
          roleBreakdown,
        },
      };
    } catch (error) {
      throw new Error(`Failed to get user registrations: ${error.message}`);
    }
  }

  // Get total bookings by time period
  static async getTotalBookings(period = "week", timeBack = 1) {
    try {
      const now = new Date();
      let startDate;

      switch (period.toLowerCase()) {
        case "week":
          startDate = new Date(
            now.getTime() - timeBack * 7 * 24 * 60 * 60 * 1000
          );
          break;
        case "month":
          startDate = new Date(now.getFullYear(), now.getMonth() - timeBack, 1);
          break;
        case "year":
          startDate = new Date(now.getFullYear() - timeBack, 0, 1);
          break;
        default:
          throw new Error("Invalid period. Use 'week', 'month', or 'year'");
      }

      // Get only counts, not the actual data
      const totalBookings = await Booking.countDocuments({
        createdAt: { $gte: startDate, $lte: now },
      });

      // Get status breakdown using aggregation
      const statusStats = await Booking.aggregate([
        {
          $match: {
            createdAt: { $gte: startDate, $lte: now },
          },
        },
        {
          $group: {
            _id: "$status",
            count: { $sum: 1 },
          },
        },
      ]);

      // Convert aggregation result to object format
      const statusBreakdown = statusStats.reduce((acc, item) => {
        acc[item._id] = item.count;
        return acc;
      }, {});

      const dateRange = formatDateRange(startDate, now);

      return {
        success: true,
        data: {
          period,
          timeBack,
          startDate: dateRange.startDate,
          endDate: dateRange.endDate,
          startDateISO: dateRange.startDateISO,
          endDateISO: dateRange.endDateISO,
          totalBookings,
          statusBreakdown,
        },
      };
    } catch (error) {
      throw new Error(`Failed to get total bookings: ${error.message}`);
    }
  }

  // Get comprehensive dashboard data
  static async getDashboardData() {
    try {
      const now = new Date();

      // Get all data in parallel
      const [
        bestCraftsmen,
        weeklyUsers,
        monthlyUsers,
        yearlyUsers,
        weeklyBookings,
        monthlyBookings,
        yearlyBookings,
        totalUsers,
        totalCraftsmen,
        totalAdmins,
        totalBookings,
        totalReviews,
      ] = await Promise.all([
        this.getBestCraftsmen(5),
        this.getUserRegistrations("week"),
        this.getUserRegistrations("month"),
        this.getUserRegistrations("year"),
        this.getTotalBookings("week"),
        this.getTotalBookings("month"),
        this.getTotalBookings("year"),
        User.countDocuments(),
        Craftsman.countDocuments(),
        User.countDocuments({ role: "admin" }),
        Booking.countDocuments(),
        Review.countDocuments(),
      ]);
      const totalClients = totalUsers - totalCraftsmen - totalAdmins;
      return {
        success: true,
        data: {
          overview: {
            totalUsers,
            totalClients,
            totalCraftsmen,
            totalAdmins,
            totalBookings,
            totalReviews,
          },
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
      };
    } catch (error) {
      throw new Error(`Failed to get dashboard data: ${error.message}`);
    }
  }
}
export default ReportService;
