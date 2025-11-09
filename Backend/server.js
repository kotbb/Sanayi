
import app from "./app.js";
import connectDB from "./config/database.js";
import { connectRedis } from "./config/redis.js";


// Database connection
connectDB();

// Redis connection
connectRedis();


// Listen to the port
const PORT = process.env.PORT || 3000;
const server = app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});

process.on("unhandledRejection", (err) => {
  console.log("UNHANDLED REJECTION! Shutting down...");
  console.log(err.name, err.message);
  // close the server first to avoid the request and responses that are running in the background to be terminated and after that exit the application by 1 means exit with failure
  server.close(() => {
    process.exit(1);
  });
});
