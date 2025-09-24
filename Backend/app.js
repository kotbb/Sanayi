const express = require("express");
const app = express();
const path = require("path");
const cors = require("cors");
const morgan = require("morgan");
const rateLimit = require("express-rate-limit");
const mongoSanitize = require("express-mongo-sanitize");
const xss = require("xss-clean");
const hpp = require("hpp");
const helmet = require("helmet");
const globalErrorHandler = require("./controllers/errorController");
const globalRouteHandler = require("./middlewares/globalRouteHandler");
const userRoute = require("./routes/userRoute");
const craftsmanRoute = require("./routes/craftsmanRoute");
const profileRoute = require("./routes/profileRoute");
const bookingRoute = require("./routes/bookingRoute");
const reviewRoute = require("./routes/reviewRoute");
const categoryRoute = require("./routes/categoryRoute");
const authRoute = require("./routes/authRoute");
const companyRoute = require("./routes/companyRoute");
//----------------------------------------------------------------------

app.use(express.static(path.join(__dirname, "public")));

// Cors
app.use(cors());

app.set("query parser", "extended");

// 1) Global Middlewares

// Security HTTP Headers
app.use(helmet());

// Limit Requests from same API
const limiter = rateLimit({
  max: 100, // 100 requests
  windowMs: 60 * 60 * 1000, // 1 hour
  message: "Too many requests from this IP, please try again!",
});
app.use("/api", limiter);

// Development Logging
if (process.env.NODE_ENV === "development") {
  app.use(morgan("dev"));
}

// Body Parser, reading data from body into req.body
app.use(express.json({ limit: "10kb" }));

// Data Sanitization against NoSQL query injection
app.use(mongoSanitize());

// Data Sanitization against XSS
app.use(xss());

// Prevent Parameter Pollution, whitelist the parameters that we want to allow to be duplicated
app.use(
  hpp({
    whitelist: ["category", "specializations", "workSchedule"],
  })
);

// Serving Static Files
app.use(express.static(`${__dirname}/public`));

// Routes
app.use("/api/users", userRoute);
app.use("/api/craftsmen", craftsmanRoute);
app.use("/api/profiles", profileRoute);
app.use("/api/auth", authRoute);
app.use("/api/bookings", bookingRoute);
app.use("/api/reviews", reviewRoute);
app.use("/api/categories", categoryRoute);
app.use("/api/companies", companyRoute);

// Global Route Handler
app.all("*", globalRouteHandler);

// Global Error Handling Middleware
app.use(globalErrorHandler);

module.exports = app;
