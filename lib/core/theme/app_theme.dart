import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryGreen = Color(0xFF245548);
  static const Color darkGreen = Color(0xFF173F32);
  static const Color gold = Color(0xFFD4AF78);
  static const Color ivory = Color(0xFFF8F4EB);
  static const Color white = Color(0xFFFFFFFF);
  static const Color textDark = Color(0xFF242820);
  static const Color textMuted = Color(0xFF77766E);
  static const Color border = Color(0xFFE8E6DE);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: ivory,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryGreen,
        primary: primaryGreen,
        secondary: gold,
        surface: white,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: ivory,
        foregroundColor: textDark,
        elevation: 0,
        centerTitle: false,
      ),
      fontFamily: 'Roboto',
    );
  }
}