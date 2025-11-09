// Health Check Controller
const getRootHealth = (req, res) => {
  res.status(200).json({
    status: "success",
    message: "Sanayi API is running",
    version: "1.0.0",
    environment: process.env.NODE_ENV || "development",
  });
};

const getApiHealth = (req, res) => {
  res.status(200).json({
    status: "success",
    message: "Sanayi API is running",
    version: "1.0.0",
    endpoints: {
      auth: "/api/auth",
      users: "/api/users",
      craftsmen: "/api/craftsmen",
      profiles: "/api/profiles",
      bookings: "/api/bookings",
      reviews: "/api/reviews",
      categories: "/api/categories",
      companies: "/api/companies",
      reports: "/api/reports",
    },
  });
};

export default {
  getRootHealth,
  getApiHealth,
};
