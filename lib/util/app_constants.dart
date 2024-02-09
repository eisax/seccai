import 'package:flutter/material.dart';
import 'package:seccai/data/model/language_model.dart';

class AppConstants {
  //app data
  static const String appName = 'seccai';
  static const String appVersion = '1.0';

  // Shared Key
  static const String theme = 'theme';

  //colors
  static const Color mainColor = Color(0xFF7ED957);

  static List<LanguageModel> languages = [
    LanguageModel(
        languageName: 'English', countryCode: 'US', languageCode: 'en'),
    LanguageModel(
        languageName: 'Arabic', countryCode: 'SA', languageCode: 'ar'),
  ];
}
