import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sanayi_app/core/helpers/shared_pref.dart';

class SecureStorageHelper {
  static setString({required PrefKeys key, String? value}) async {
    final storage = FlutterSecureStorage();
    await storage.write(key: key.name, value: value);
  }

  static Future<String> getString({required PrefKeys key}) async {
    final storage = FlutterSecureStorage();
    return await storage.read(key: key.name) ?? '';
  }

  static deleteForKey({required PrefKeys key}) async {
    final storage = FlutterSecureStorage();
    return await storage.delete(key: key.name);
  }

  static clearAll() async {
    final storage = FlutterSecureStorage();
    return await storage.deleteAll();
  }
}
