import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  final Locale? locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  late Map<String, String> localizedStrings;

  Future<void> loadLangejson() async {
    try {
      String jsonString = await rootBundle.loadString("assets/lang/${locale!.languageCode}.json");
      Map<String, dynamic> jsonMap = json.decode(jsonString);
      localizedStrings = jsonMap.map((key, value) {
        return MapEntry(key, value.toString());
      });
    } catch (e) {
      localizedStrings = {};
      debugPrint("Error loading localization file: $e");
    }
  }

  String translate(String key) {
    return localizedStrings[key] ?? key;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = AppLocalizationsDelegate();
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.loadLangejson();
    return localizations;
  }

  @override
  bool shouldReload(covariant AppLocalizationsDelegate old) => false;
}

extension TranslateX on String {
  String tr(BuildContext context) {
    return AppLocalizations.of(context)?.translate(this) ?? this;
  }
}
