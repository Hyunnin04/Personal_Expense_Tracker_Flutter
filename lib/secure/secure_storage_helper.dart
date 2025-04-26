import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageHelper {
  static final _storage = FlutterSecureStorage();

  static Future<void> saveToken(String token) async {
    await _storage.write(key: 'token', value: token);
  }

  static Future<String?> getToken() async {
    return await _storage.read(key: 'token');
  }

  static Future<void> deleteToken() async {
    await _storage.delete(key: 'token');
  }
}




//// To clall 
// await SecureStorageHelper.saveToken("YOUR_TOKEN");
// String? token = await SecureStorageHelper.getToken();
// await SecureStorageHelper.deleteToken();