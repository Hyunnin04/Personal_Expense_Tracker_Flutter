import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // Existing methods and properties

  static Future<bool> addExpense({
    required double amount,
    required String category,
    required DateTime date,
    required String notes,
  }) async {
    // Simulate API call
    await Future.delayed(Duration(seconds: 2));
    return true; // Return true to indicate success
  }

  static const String baseUrl =
      'http://10.0.2.2:3000'; // Android emulator localhost

  static Future<String?> login({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('$baseUrl/api/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['token'];
    } else {
      return null;
    }
  }

  static Future<String?> signup(
    String param1,
    String param2, String text, {
    required String username,
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('$baseUrl/api/signup');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['token'];
    } else {
      return null;
    }
  }
}
