// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

const String ENGLISH = 'en';
const String ARABIC = 'ar';
const  LOCALIZATION_PATH = 'assets/translation';

const Locale LOCAL_ENGLISH = Locale('en', 'US');
const Locale LOCAL_ARABIC = Locale('ar', 'SA');

enum LanguageType { ENGLISH, ARABIC }

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.ENGLISH:
        return ENGLISH;
      case LanguageType.ARABIC:
        return ARABIC;
    }
  }
}
