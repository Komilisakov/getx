import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'locals/en_us.dart';
import 'locals/ru_ru.dart';
import 'locals/uz_uz.dart';

class LangService extends Translations {
  // Default locale
  static final locale = Locale('en', 'US'); //Get.locale;

  // fallbackLocale saves the day when the locale gets in trouble
  static final fallbackLocale = Locale('en', 'US');

  // Supported languages
  // Needs to be same order with locales
  static final items = [
    'English',
    'Русский',
    'O`zbek',
  ];

  static final flags = [
    'lan_us.png',
    'lan_ru.png',
    'lan_uz.png',
  ];

  static final langs = [
    'en',
    'ru',
    'uz',
  ];

  // Supported locales
  // Needs to be same order with langs
  static final locales = [
    Locale('en', 'US'),
    Locale('ru', 'RU'),
    Locale('uz', 'UZ'),
  ];

  // Keys and their translations
  // Translations are separated maps in `lang` file
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS, // lang/en_us.dart
        'ru_RU': ruRU, // lang/ru_ru.dart
        'uz_UZ': uzUZ, // lang/uz_uz.dart
      };

  // Gets locale from language, and updates the locale
  void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    if (locale != null) {
      Get.updateLocale(locale);
    }
  }

  // Finds language in `langs` list and returns it as Locale
  Locale? _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.deviceLocale;
  }

  String defaultLanguage() {
    final locale = Get.locale;
    var lan = locale.toString();
    if(lan == "ru_RU") return langs[1];
    if(lan == "uz_UZ") return langs[2];
    return langs[0];
  }
}
