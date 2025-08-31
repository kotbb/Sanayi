bool isLoggedInUser = false;

class SharedPrefKeys {
  static const String token = 'token';
  static const String language = 'language';
}

enum RequestsStatus { initial, loading, success, error }