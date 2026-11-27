  import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthResult {
  success,
  emailAlreadyRegistered,
  invalidCredentials,
}

class AuthService {
  static final ValueNotifier<bool> isLoggedIn = ValueNotifier(false);

  static String? currentUserEmail;
  static String? currentUserName;

  static const String _emailKey = 'auth_user_email';
  static const String _passwordKey = 'auth_user_password';
  static const String _nameKey = 'auth_user_name';
  static const String _sessionKey = 'auth_is_logged_in';

  // Load the saved login session when the app starts.
  static Future<void> loadSession() async {
    final prefs = await SharedPreferences.getInstance();

    isLoggedIn.value = prefs.getBool(_sessionKey) ?? false;

    if (isLoggedIn.value) {
      currentUserEmail = prefs.getString(_emailKey);
      currentUserName = prefs.getString(_nameKey);
    }
  }

  // Register a new demo account.
  static Future<AuthResult> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    final existingEmail = prefs.getString(_emailKey);

    if (existingEmail != null &&
        existingEmail.toLowerCase() == email.trim().toLowerCase()) {
      return AuthResult.emailAlreadyRegistered;
    }

    await prefs.setString(_nameKey, name.trim());
    await prefs.setString(_emailKey, email.trim().toLowerCase());
    await prefs.setString(_passwordKey, password);

    await prefs.setString('profile_name', name.trim());
    await prefs.setString('profile_email', email.trim().toLowerCase());

    await _startSession(
      name: name.trim(),
      email: email.trim().toLowerCase(),
    );

    return AuthResult.success;
  }

  // Log in using the registered demo account.
  static Future<AuthResult> login({
    required String email,
    required String password,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    final savedEmail = prefs.getString(_emailKey);
    final savedPassword = prefs.getString(_passwordKey);
    final savedName = prefs.getString(_nameKey);

    if (savedEmail == null ||
        savedPassword == null ||
        savedName == null) {
      return AuthResult.invalidCredentials;
    }

    if (savedEmail != email.trim().toLowerCase() ||
        savedPassword != password) {
      return AuthResult.invalidCredentials;
    }

    await _startSession(
      name: savedName,
      email: savedEmail,
    );

    return AuthResult.success;
  }

  // Start a logged-in session.
  static Future<void> _startSession({
    required String name,
    required String email,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool(_sessionKey, true);

    currentUserName = name;
    currentUserEmail = email;

    isLoggedIn.value = true;
  }

  // Log out without deleting the registered demo account.
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool(_sessionKey, false);

    currentUserName = null;
    currentUserEmail = null;

    isLoggedIn.value = false;
  }
}