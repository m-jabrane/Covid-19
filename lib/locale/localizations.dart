import 'dart:async' show Future;
import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';
import './constant.dart' show languages;

class MyLocalizations {
  final Map<String, Map<String, String>> localizedValues;
  MyLocalizations(this.locale, this.localizedValues);

  final Locale locale;

  static MyLocalizations of(BuildContext context) {
    return Localizations.of<MyLocalizations>(context, MyLocalizations);
  }

  String get appNameCovid {
    return localizedValues[locale.languageCode]['appNameCovid'];
  }

  String get appNameMorocco {
    return localizedValues[locale.languageCode]['appNameMorocco'];
  }

  String get tabOverview {
    return localizedValues[locale.languageCode]['tabOverview'];
  }

  String get tabRegions {
    return localizedValues[locale.languageCode]['tabRegions'];
  }

  String get tabQuarantine {
    return localizedValues[locale.languageCode]['tabQuarantine'];
  }

  String get lastUpdate {
    return localizedValues[locale.languageCode]['lastUpdate'];
  }

  String get overviewConfirmedCases {
    return localizedValues[locale.languageCode]['overviewConfirmedCases'];
  }

  String get overviewDeaths {
    return localizedValues[locale.languageCode]['overviewDeaths'];
  }

  String get overviewRecovered {
    return localizedValues[locale.languageCode]['overviewRecovered'];
  }

  String get overviewExcluded {
    return localizedValues[locale.languageCode]['overviewExcluded'];
  }

  String get regionConfirmedCases {
    return localizedValues[locale.languageCode]['regionConfirmedCases'];
  }

  String get regionBeniMellal {
    return localizedValues[locale.languageCode]['regionBeniMellal'];
  }

  String get regionCasa {
    return localizedValues[locale.languageCode]['regionCasa'];
  }

  String get regionDaraa {
    return localizedValues[locale.languageCode]['regionDaraa'];
  }

  String get regionDakhla {
    return localizedValues[locale.languageCode]['regionDakhla'];
  }

  String get regionFes {
    return localizedValues[locale.languageCode]['regionFes'];
  }

  String get regionGuelmim {
    return localizedValues[locale.languageCode]['regionGuelmim'];
  }

  String get regionLaayoun {
    return localizedValues[locale.languageCode]['regionLaayoun'];
  }

  String get regionMarrakesh {
    return localizedValues[locale.languageCode]['regionMarrakesh'];
  }

  String get regionOriental {
    return localizedValues[locale.languageCode]['regionOriental'];
  }

  String get regionRabat {
    return localizedValues[locale.languageCode]['regionRabat'];
  }

  String get regionSouss {
    return localizedValues[locale.languageCode]['regionSouss'];
  }

  String get regionTanger {
    return localizedValues[locale.languageCode]['regionTanger'];
  }

  String get quarantineDate {
    return localizedValues[locale.languageCode]['quarantineDate'];
  }

  String get noInternetError {
    return localizedValues[locale.languageCode]['noInternetError'];
  }

  String get notConnectedError {
    return localizedValues[locale.languageCode]['notConnectedError'];
  }

  String get checkConnectionError {
    return localizedValues[locale.languageCode]['checkConnectionError'];
  }
}

class MyLocalizationsDelegate extends LocalizationsDelegate<MyLocalizations> {
  Map<String, Map<String, String>> localizedValues;

  MyLocalizationsDelegate(this.localizedValues);

  @override
  bool isSupported(Locale locale) => languages.contains(locale.languageCode);

  @override
  Future<MyLocalizations> load(Locale locale) {
    return SynchronousFuture<MyLocalizations>(
        MyLocalizations(locale, localizedValues));
  }

  @override
  bool shouldReload(MyLocalizationsDelegate old) => false;
}
