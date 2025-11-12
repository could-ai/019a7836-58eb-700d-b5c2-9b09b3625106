import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider with ChangeNotifier {
  Locale _locale = const Locale('en');
  static const String _localeKey = 'locale';

  Locale get locale => _locale;

  LocaleProvider() {
    _loadLocale();
  }

  Future<void> _loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString(_localeKey) ?? 'en';
    _locale = Locale(languageCode);
    notifyListeners();
  }

  Future<void> setLocale(Locale locale) async {
    if (_locale == locale) return;
    _locale = locale;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeKey, locale.languageCode);
    notifyListeners();
  }

  // Supported locales
  static const List<Locale> supportedLocales = [
    Locale('en'), // English
    Locale('pt'), // Portuguese
    Locale('es'), // Spanish
  ];

  // Language names
  static const Map<String, String> languageNames = {
    'en': '🇺🇸 English',
    'pt': '🇧🇷 Português',
    'es': '🇪🇸 Español',
  };
}
