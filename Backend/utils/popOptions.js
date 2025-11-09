// Booking Pop Options
const bookingPopOptions = [
  {
    path: "craftsman",
    select: "user specializations",
    populate: {
      path: "user",
      select: "name profilePicture phoneNumber",
    },
  },
  {
    path: "client",
    select: "name profilePicture phoneNumber",
  },
];

// Review Pop Options
const reviewCraftsmanPopOptions = {
  path: "craftsman",
  select: "user -specializations",
  populate: { path: "user", select: "name phoneNumber" },
};

const reviewClientPopOptions = {
  path: "client",
  select: "name phoneNumber",
};
const reviewPopOptions = [reviewCraftsmanPopOptions, reviewClientPopOptions];

// Craftsman Pop Options
const craftsmanPopOptions = [
  {
    path: "specializations",
    select: "name",
  },
  {
    path: "user",
    select: "name profilePicture phoneNumber isActive",
  },
];

export {
  bookingPopOptions,
  reviewPopOptions,
  craftsmanPopOptions,
  reviewClientPopOptions,
  reviewCraftsmanPopOptions,
};
