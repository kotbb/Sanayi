import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  
  late SharedPreferences preferences;
  static SharedPrefHelper? _instance;
  SharedPrefHelper._();

  factory SharedPrefHelper() {
    return _instance ??= SharedPrefHelper._();
  }

  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  /// Set a value for a given key in SharedPreferences
  void setValueForKey({required PrefKeys key, required dynamic value}) {
    switch (value.runtimeType) {
      case String:
        preferences.setString(key.name, value);
        break;
      case int:
        preferences.setInt(key.name, value);
        break;
      case double:
        preferences.setDouble(key.name, value);
        break;
      case bool:
        preferences.setBool(key.name, value);
        break;
      
      default:
        throw Exception('Unsupported type: ${value.runtimeType}');
    }
  }

  /// Get a value for a given key in SharedPreferences with a default value
  T getValueForKey<T>({required PrefKeys key, required T defaultValue}) {
    return preferences.get(key.name) as T? ?? defaultValue;
  }

  /// Get a value for a given key in SharedPreferences without a default value
  Future<void> removeKey({required PrefKeys key}) async {
    await preferences.remove(key.name);
  }
  
  /// Clear all values in SharedPreferences
  Future<void> clearAll() async {
    await preferences.clear();
  }
  
}

enum PrefKeys {
  token,
  language,
  isOnboardingSeen,
  isLoggedIn,
  userName,
  refreshToken,
  userId,
  role
}