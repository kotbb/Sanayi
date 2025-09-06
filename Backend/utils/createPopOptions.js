const reviewPopOptions = () => {
  return [
    { path: "user", select: "name phoneNumber" },
    {
      path: "craftsman",
      select: "user",
      populate: { path: "user", select: "name phoneNumber" },
    },
  ];
};

const craftsmanPopOptions = () => {
  return [
    { path: "specializations", select: "name" },
    { path: "user", select: "name phoneNumber" },
  ];
};

const bookingPopOptions = () => {
  return [
    { path: "client", select: "name phoneNumber" },
    {
      path: "craftsman",
      populate: { path: "user", select: "name phoneNumber" },
    },
  ];
};

module.exports = {
  reviewPopOptions,
  bookingPopOptions,
  craftsmanPopOptions,
};
