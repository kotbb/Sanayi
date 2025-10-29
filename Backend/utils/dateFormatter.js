
const formatDate = (date, separator = "/") => {
  if (!date || !(date instanceof Date)) {
    return null;
  }

  const year = date.getFullYear();
  const month = date.getMonth() + 1; // getMonth() returns 0-11, so add 1
  const day = date.getDate();

  return `${year}${separator}${month}${separator}${day}`;
};
const formatDateRange = (startDate, endDate, separator = "/") => {
  return {
    startDate: formatDate(startDate, separator),
    endDate: formatDate(endDate, separator),
    startDateISO: startDate?.toISOString(),
    endDateISO: endDate?.toISOString(),
  };
};

module.exports = {
  formatDate,
  formatDateRange,
};
