import 'package:expense_tracker/secure/secure_storage_helper.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String? _token;

  bool get isAuthenticated => _token != null;

  Future<void> login(String token) async {
    _token = token;
    await SecureStorageHelper.saveToken(token);
    notifyListeners();
  }

  Future<void> logout() async {
    _token = null;
    await SecureStorageHelper.deleteToken();
    notifyListeners();
  }

  Future<void> tryAutoLogin() async {
    final token = await SecureStorageHelper.getToken();
    if (token != null) {
      _token = token;
      notifyListeners();
    }
  }
}
