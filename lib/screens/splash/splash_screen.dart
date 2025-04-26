import 'package:expense_tracker/screens/auth/login_screen.dart';
import 'package:expense_tracker/screens/home/home_screen.dart';
import 'package:expense_tracker/secure/secure_storage_helper.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  

  Future<void> checkLogin() async {
    final token = await SecureStorageHelper.getToken();

    if (token != null) {
      // If token exists, go to Home
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomeScreen()),
      );
    } else {
      // No token, go to Login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(), // Small loading spinner
      ),
    );
  }
}
