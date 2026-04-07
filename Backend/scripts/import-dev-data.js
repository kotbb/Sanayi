import dotenv from "dotenv";
import { fileURLToPath } from "url";
import path from "path";
import mongoose from "mongoose";

import connectDB from "../config/database.js";
import Category from "../models/categoryModel.js";
import User from "../models/userModel.js";
import Craftsman from "../models/craftsmanModel.js";
import Booking from "../models/bookingModel.js";
import Review from "../models/reviewModel.js";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

dotenv.config({ path: path.join(__dirname, "../config.env") });

const egyptianLocations = [
  { city: "Cairo", address: "Nasr City, Abbas El Akkad St" },
  { city: "Giza", address: "Dokki, Tahrir St" },
  { city: "Alexandria", address: "Sidi Gaber, Abu Qir St" },
  { city: "Mansoura", address: "Gomhoria St" },
  { city: "Tanta", address: "El Geish St" },
  { city: "Zagazig", address: "University District" },
  { city: "Sohag", address: "El Kornesh St" },
  { city: "Asyut", address: "Yousry Ragheb St" },
];

const categoryNames = [
  "Plumbing",
  "Electricity",
  "Carpentry",
  "Painting",
  "Air Conditioning",
  "Ceramics",
];

const craftsmanSeed = [
  { name: "Ahmed Hassan", phoneNumber: "01010000001", hourlyRate: 180, specializations: ["Plumbing"] },
  { name: "Mahmoud Ali", phoneNumber: "01010000002", hourlyRate: 220, specializations: ["Electricity"] },
  { name: "Mostafa Ibrahim", phoneNumber: "01010000003", hourlyRate: 200, specializations: ["Carpentry"] },
  { name: "Youssef Adel", phoneNumber: "01010000004", hourlyRate: 170, specializations: ["Painting"] },
  { name: "Karim Nabil", phoneNumber: "01010000005", hourlyRate: 260, specializations: ["Air Conditioning", "Electricity"] },
];

const clientSeed = [
  { name: "Mona Samir", phoneNumber: "01020000001" },
  { name: "Nourhan Fathy", phoneNumber: "01020000002" },
  { name: "Heba Magdy", phoneNumber: "01020000003" },
  { name: "Omar Tarek", phoneNumber: "01020000004" },
  { name: "Khaled Ehab", phoneNumber: "01020000005" },
  { name: "Salma Gamal", phoneNumber: "01020000006" },
];

const adminSeed = [{ name: "Admin User", phoneNumber: "01099999999", role: "admin" }];

const workSchedule = [
  { day: "saturday", available: true, startTime: "09:00", endTime: "17:00" },
  { day: "sunday", available: true, startTime: "09:00", endTime: "17:00" },
  { day: "monday", available: true, startTime: "09:00", endTime: "17:00" },
  { day: "tuesday", available: true, startTime: "09:00", endTime: "17:00" },
  { day: "wednesday", available: true, startTime: "09:00", endTime: "17:00" },
  { day: "thursday", available: true, startTime: "09:00", endTime: "15:00" },
  { day: "friday", available: false },
];

const pickLocation = (index) => {
  const location = egyptianLocations[index % egyptianLocations.length];
  return {
    country: "Egypt",
    city: location.city,
    address: location.address,
  };
};

const createUsersPayload = () => {
  const clients = clientSeed.map((client, index) => ({
    ...client,
    role: "client",
    location: pickLocation(index),
    isVerified: true,
    password: "test1234",
  }));

  const craftsmen = craftsmanSeed.map((craftsman, index) => ({
    name: craftsman.name,
    phoneNumber: craftsman.phoneNumber,
    role: "craftsman",
    location: pickLocation(index + clients.length),
    isVerified: true,
    password: "test1234",
  }));

  const admins = adminSeed.map((admin, index) => ({
    ...admin,
    location: pickLocation(index + clients.length + craftsmen.length),
    isVerified: true,
    password: "test1234",
  }));

  return [...clients, ...craftsmen, ...admins];
};

const buildBookings = (clients, craftsmen) => {
  const now = new Date();
  const statuses = ["completed", "completed", "confirmed", "pending", "cancelled"];

  const bookings = [];
  for (let i = 0; i < 14; i += 1) {
    const client = clients[i % clients.length];
    const craftsman = craftsmen[i % craftsmen.length];
    const status = statuses[i % statuses.length];
    const bookingDate = new Date(now);
    bookingDate.setDate(now.getDate() - 12 + i * 3);

    bookings.push({
      client: client._id,
      craftsman: craftsman._id,
      price: craftsman.hourlyRate + 120 + (i % 4) * 40,
      date: bookingDate,
      time: `${9 + (i % 7)}:00`,
      status,
    });
  }

  return bookings;
};

const reviewComments = [
  "Very professional and on time.",
  "Great quality and clean finish.",
  "Helpful communication and fair pricing.",
  "Excellent service, recommended.",
  "Good work and respectful behavior.",
];

const buildReviews = (bookings) => {
  const completedBookings = bookings.filter((booking) => booking.status === "completed");
  return completedBookings.map((booking, index) => ({
    booking: booking._id,
    client: booking.client,
    craftsman: booking.craftsman,
    rating: 4 + (index % 2),
    comment: reviewComments[index % reviewComments.length],
  }));
};

const importData = async () => {
  try {
    await connectDB();

    await Review.deleteMany();
    await Booking.deleteMany();
    await Craftsman.deleteMany();
    await Category.deleteMany();
    await User.deleteMany();

    const categories = await Category.insertMany(
      categoryNames.map((name) => ({ name, isActive: true }))
    );
    const categoryMap = new Map(categories.map((category) => [category.name, category._id]));

    const users = await User.create(createUsersPayload());

    const clients = users.filter((user) => user.role === "client");
    const craftsmanUsers = users.filter((user) => user.role === "craftsman");

    const craftsmanPayload = craftsmanSeed.map((seedItem, index) => ({
      user: craftsmanUsers[index]._id,
      specializations: seedItem.specializations.map((name) => categoryMap.get(name)),
      workSchedule,
      portfolio: [
        {
          title: `${seedItem.name} Portfolio`,
          description: `Recent ${seedItem.specializations.join(" / ")} projects in Egypt`,
          images: ["portfolio-default-1.jpg"],
        },
      ],
      hourlyRate: seedItem.hourlyRate,
    }));

    const craftsmen = await Craftsman.create(craftsmanPayload);
    const craftsmenWithRates = craftsmen.map((craftsman, index) => ({
      _id: craftsman._id,
      hourlyRate: craftsmanSeed[index].hourlyRate,
    }));

    const bookings = await Booking.create(buildBookings(clients, craftsmenWithRates));
    const reviews = await Review.create(buildReviews(bookings));

    console.log("Development data imported successfully.");
    console.log(`Categories: ${categories.length}`);
    console.log(`Users: ${users.length} (all passwords are: test1234)`);
    console.log(`Craftsmen: ${craftsmen.length}`);
    console.log(`Bookings: ${bookings.length}`);
    console.log(`Reviews: ${reviews.length}`);
  } catch (error) {
    console.error("Failed to import development data:", error);
  } finally {
    await mongoose.connection.close();
    process.exit();
  }
};

const deleteData = async () => {
  try {
    await connectDB();

    await Review.deleteMany();
    await Booking.deleteMany();
    await Craftsman.deleteMany();
    await Category.deleteMany();
    await User.deleteMany();

    console.log("Development data deleted successfully.");
  } catch (error) {
    console.error("Failed to delete development data:", error);
  } finally {
    await mongoose.connection.close();
    process.exit();
  }
};

if (process.argv[2] === "--import") {
  importData();
} else if (process.argv[2] === "--delete") {
  deleteData();
} else {
  console.log("Use: node scripts/import-dev-data.js --import | --delete");
  process.exit();
}
