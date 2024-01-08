import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const FlutterSecureStorage secureStorage = FlutterSecureStorage();
  static Future<String> readToken(String key) async {
    String? token;
    try {
      token = await secureStorage.read(key: key);
    } catch (e) {
      token = null;
    }
    return token ?? '';
  }
  // static Future<String> readLocation(String key) async {
  //   String? location ;
  //   try {
  //     location = await secureStorage.read(key: key);
  //   } catch (e) {
  //     location = null;
  //   }
  //   return location ??'coimbatore';
  // }

  static Future<void> addToken(String key, String value) async {
    secureStorage.write(key: key, value: value);
  }

  static Future<void> usserId(String key, String value) async {
    secureStorage.write(key: key, value: value);
  }

  static Future<void> clearSecureStoragevalue(String key) async {
    await secureStorage.delete(key: key);
  }

  static Future<void> addingvaluesToStorage(String key, String value) async {
    secureStorage.write(key: key, value: value);
  }
}
