import 'package:flutter/material.dart';
import 'core/routing/main_navigation.dart';
import 'core/theme/app_theme.dart';

void main() {
  runApp(const SyriaDiscoverApp());
}

class SyriaDiscoverApp extends StatelessWidget {
  const SyriaDiscoverApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Syria Discover',
      theme: AppTheme.lightTheme,
      home: const MainNavigation(),
    );
  }
}