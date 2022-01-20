import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static void saveToken(String token) async {
    final secureStorage = FlutterSecureStorage();
    await secureStorage.write(key: 'token', value: token);
  }

  static Future<String> getToken() async {
    final secureStorage = FlutterSecureStorage();
    final token = await secureStorage.read(key: 'token');
    return token!;
  }

  static void deleteToken() async {
    final secureStorage = FlutterSecureStorage();
    await secureStorage.delete(key: 'token');
  }

  static void saveUserId(String userId) async {
    final secureStorage = FlutterSecureStorage();
    await secureStorage.write(key: 'userId', value: userId);
  }

  static Future<String> getUserId() async {
    final secureStorage = FlutterSecureStorage();
    final userId = await secureStorage.read(key: 'userId');
    return userId!;
  }
}
