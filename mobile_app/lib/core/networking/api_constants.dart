class ApiConstants {
  static const String baseUrl = "http://10.0.2.2:4000/api/";
  static const String login = "auth/login";
  static const String register = "auth/register/send-otp";
  static const String verifyOtp = "auth/register/verify-otp/";
  static const String completeRegister = "auth/register/complete";
  static const String logout = "auth/logout";
  static const String refreshToken = 'auth/refresh-token';
  static const String getAllCategories = "categories";
  static const String getAllCraftsmen = "craftsmen";
  static const String getCraftsmen = "craftsmen/";
  static const String getAllCraftsmenInCategories = "categories/";
  static const String getMyBookings = "profiles/my-bookings";
  static const String getMyProfile = "profiles/me";
  static const String profileUpdate = "profiles/updateMe";
  static const String updateBooking = "bookings/";
  static const String createBooking = "bookings";
}
