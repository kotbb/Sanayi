import express from "express";
import path from "path";
import { fileURLToPath } from "url";
import cors from "cors";
import morgan from "morgan";
import rateLimit from "express-rate-limit";
import mongoSanitize from "express-mongo-sanitize";
import xss from "xss-clean";
import hpp from "hpp";
import helmet from "helmet";
import globalErrorHandler from "./controllers/errorController.js";
import globalRouteHandler from "./middlewares/globalRouteHandler.js";
import healthController from "./controllers/healthController.js";
import userRoute from "./routes/userRoute.js";
import craftsmanRoute from "./routes/craftsmanRoute.js";
import profileRoute from "./routes/profileRoute.js";
import bookingRoute from "./routes/bookingRoute.js";
import reviewRoute from "./routes/reviewRoute.js";
import categoryRoute from "./routes/categoryRoute.js";
import authRoute from "./routes/authRoute.js";
import companyRoute from "./routes/companyRoute.js";
import reportRoute from "./routes/reportRoute.js";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const app = express();

// Trust proxy - Required for Vercel and other proxy/load balancer environments
// Set to 1 to trust only the first proxy (Vercel), not all proxies
if (process.env.NODE_ENV === "production") {
  app.set("trust proxy", 1);
}

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
  validate: process.env.NODE_ENV !== "production",
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
app.use(express.static(path.join(__dirname, "public")));

// Health Check Routes (must be defined before other routes)
app.get("/", healthController.getRootHealth);
app.get("/api", healthController.getApiHealth);

// API Routes
app.use("/api/users", userRoute);
app.use("/api/craftsmen", craftsmanRoute);
app.use("/api/profiles", profileRoute);
app.use("/api/auth", authRoute);
app.use("/api/bookings", bookingRoute);
app.use("/api/reviews", reviewRoute);
app.use("/api/categories", categoryRoute);
app.use("/api/companies", companyRoute);
app.use("/api/reports", reportRoute);

// Global Route Handler
app.all("*", globalRouteHandler);

// Global Error Handling Middleware
app.use(globalErrorHandler);

export default app;
