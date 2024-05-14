import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../model/User.dart';

class SharedPreferencesManager {
  static const String _keyUser = 'user';
  static const String _keyWelcomeCheck = 'welcome_check';
  static const String _trustedDevice = 'trusted_device';
  static const String _token = 'token';
  static const String _orderStatus = 'orderStatus';
  static const String _orderId = 'orderId';

  // Save the user object to SharedPreferences
  static Future<void> saveUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = jsonEncode(user.toJson());
    await prefs.setString(_keyUser, userJson);
  }

  // Retrieve the user object from SharedPreferences
  static Future<User?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString(_keyUser);
    if (userJson != null) {
      final userMap = jsonDecode(userJson);
      return User.fromJson(userMap);
    }
    return null;
  }

  Future<String?> getUserEmail() async {
    final user = await SharedPreferencesManager.getUser();
    if (user != null) {
      return user.email;
    } else {
      // User data is not available or the user is not logged in.
      return null;
    }
  }

  // Check if the "Welcome" screen has been displayed before
  static Future<bool> getWelcomeCheck() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyWelcomeCheck) ?? false;
  }

  // Set the "Welcome" check to true
  static Future<void> setWelcomeCheck(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyWelcomeCheck, value);
  }

  static Future<bool> getTrustedDevice() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_trustedDevice) ?? false;
  }

  // Set the "Welcome" check to true
  static Future<void> setTrustedDevice(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_trustedDevice, value);
  }

  static Future<void> setToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_token, token);
  }

  static Future<String> geToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_token) ?? "";
  }

  static Future<void> setOrderStatus(String orderStatus) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_orderStatus, orderStatus);
  }

  static Future<String> getOrderStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_orderStatus) ?? "Not Process";
  }
  static Future<void> setOrderId(String orderId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_orderId, orderId);
  }

  static Future<String> getOrderId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_orderId) ?? "";
  }

  // Clear user data and "Welcome" check on logout
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyUser);
  }

  static Future<void> clearPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyWelcomeCheck);
  }
}
