class AppRegex {
  
  /// Validates a phone number.
  /// 1- phone number must begin with 059 or 056 and be followed by 7 digits.
  /// 2- phone number must be 10 digits long.
  /// 3- phone number must not contain any letters or special characters.
  /// 4- phone number must not contain spaces.
  static String validatePhoneNumber(String phoneNumber) {
    final regex = RegExp(r'^(059|056)\d{7}$');
    if (!regex.hasMatch(phoneNumber)) {
      return 'Invalid phone number format.';
    } else if (phoneNumber.length != 10) {
      return 'Phone number must be 10 digits long.';
    }
    return '';
  }
}
