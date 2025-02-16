import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  bool _isAuthenticated = false;
  String _role = "";

  bool get isAuthenticated => _isAuthenticated;
  String get role => _role;

  // Check Login Status on App Start
  Future<void> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isAuthenticated = prefs.getBool("isAuthenticated") ?? false;
    _role = prefs.getString("role") ?? "";
    notifyListeners();
  }

  // Login Function
  Future<void> login(String username, String password) async {
    if (username == "admin" && password == "admin") {
      _isAuthenticated = true;
      _role = "admin";
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool("isAuthenticated", true);
      await prefs.setString("role", _role);
      notifyListeners();
    }
  }

  // ✅ Logout Function
  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    _isAuthenticated = false;
    _role = "";
    notifyListeners();
  }
}
