const validator = require("validator");

const isValidPhoneNumber = (phoneNumber) => {
  const regex = /^(?:\+9705[69]\d{7}|05[69]\d{7})$/;
  return (
    validator.isMobilePhone(phoneNumber, "ar-EG") || regex.test(phoneNumber)
  );
};

module.exports = isValidPhoneNumber;
