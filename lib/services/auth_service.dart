import 'dart:convert';
import 'package:expense_tracker/secure/secure_storage_helper.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static const String baseUrl = 'http://localhost:3000'; // Your backend URL

  static Future<Map<String, dynamic>?> getProfile() async {
    final token = await SecureStorageHelper.getToken();
    if (token == null) return null;

    final response = await http.get(
      Uri.parse('$baseUrl/profile'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }

  static Future<void> logout() async {
    await SecureStorageHelper.deleteToken();
  }
}
