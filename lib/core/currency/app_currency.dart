import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppCurrency {
  static const List<String> supportedCurrencies = [
    'USD',
    'SYP',
    'EUR',
  ];

  static final ValueNotifier<String> currency =
      ValueNotifier('USD');

  static Future<void> loadCurrency() async {
    final prefs = await SharedPreferences.getInstance();

    final savedCurrency = prefs.getString('app_currency') ?? 'USD';

    currency.value = supportedCurrencies.contains(savedCurrency)
        ? savedCurrency
        : 'USD';
  }

  static Future<void> changeCurrency(String currencyCode) async {
    if (!supportedCurrencies.contains(currencyCode)) return;

    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('app_currency', currencyCode);

    currency.value = currencyCode;
  }
}