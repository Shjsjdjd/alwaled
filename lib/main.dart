import 'package:flutter/material.dart';

import 'core/currency/app_currency.dart';
import 'core/routing/main_navigation.dart';
import 'core/theme/app_theme.dart';
import 'core/localization/app_language.dart';
import 'core/auth/auth_service.dart';
import 'l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppLanguage.loadLanguage();
  await AppCurrency.loadCurrency();
  await AuthService.loadSession();

  runApp(const SyriaDiscoverApp());
}

class SyriaDiscoverApp extends StatelessWidget {
  const SyriaDiscoverApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Locale>(
      valueListenable: AppLanguage.locale,
      builder: (context, locale, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Syria Discover',
          theme: AppTheme.lightTheme,
          locale: locale,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates:
              AppLocalizations.localizationsDelegates,
          home: const MainNavigation(),
        );
      },
    );
  }
}