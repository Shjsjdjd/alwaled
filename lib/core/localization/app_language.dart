import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguage {
  static final ValueNotifier<Locale> locale =
      ValueNotifier(const Locale('en'));

  static Future<void> loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();

    final savedLanguage = prefs.getString('app_language') ?? 'en';

    locale.value = Locale(savedLanguage);
  }

  static Future<void> changeLanguage(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('app_language', languageCode);

    locale.value = Locale(languageCode);
  }
}