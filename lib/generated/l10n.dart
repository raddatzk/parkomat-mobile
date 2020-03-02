// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

class S {
  S(this.localeName);
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final String name = locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return S(localeName);
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  final String localeName;

  String get checkConnection {
    return Intl.message(
      'Could not find parkomat.',
      name: 'checkConnection',
      desc: '',
      args: [],
    );
  }

  String get checkUrl {
    return Intl.message(
      'Invalid url.',
      name: 'checkUrl',
      desc: '',
      args: [],
    );
  }

  String get couldNotConnect {
    return Intl.message(
      'No internet connection.',
      name: 'couldNotConnect',
      desc: '',
      args: [],
    );
  }

  String lastUpdateAt(dynamic datetime) {
    return Intl.message(
      'Last update: $datetime',
      name: 'lastUpdateAt',
      desc: '',
      args: [datetime],
    );
  }

  String get lastUpdateLastMonth {
    return Intl.message(
      'Last update: Last month',
      name: 'lastUpdateLastMonth',
      desc: '',
      args: [],
    );
  }

  String get lastUpdateLastWeek {
    return Intl.message(
      'Last update: Last week',
      name: 'lastUpdateLastWeek',
      desc: '',
      args: [],
    );
  }

  String get lastUpdateLastYear {
    return Intl.message(
      'Last update: Last year',
      name: 'lastUpdateLastYear',
      desc: '',
      args: [],
    );
  }

  String get lastUpdateLongAgo {
    return Intl.message(
      'Last update: Very long ago',
      name: 'lastUpdateLongAgo',
      desc: '',
      args: [],
    );
  }

  String get lastUpdateToday {
    return Intl.message(
      'Last update: Today',
      name: 'lastUpdateToday',
      desc: '',
      args: [],
    );
  }

  String get lastUpdateYesterday {
    return Intl.message(
      'Last update: Yesterday',
      name: 'lastUpdateYesterday',
      desc: '',
      args: [],
    );
  }

  String normalOnesAnd(dynamic amount) {
    return Intl.plural(
      amount,
      zero: 'No normal ones and ',
      one: 'One normal one and ',
      other: '$amount normal ones and ',
      name: 'normalOnesAnd',
      desc: '',
      args: [amount],
    );
  }

  String onTheLifts(dynamic amount) {
    return Intl.plural(
      amount,
      zero: 'no on the lifts.',
      one: 'one on the lifts.',
      other: '$amount on the lifts.',
      name: 'onTheLifts',
      desc: '',
      args: [amount],
    );
  }

  String parkingSpots(dynamic amount) {
    return Intl.plural(
      amount,
      one: '1 parking spot',
      other: '$amount parking spots',
      name: 'parkingSpots',
      desc: '',
      args: [amount],
    );
  }

  String get sincerely {
    return Intl.message(
      '\nSincerely -- your parkomat.',
      name: 'sincerely',
      desc: '',
      args: [],
    );
  }

  String thereAreFreeParkingSpots(dynamic amount) {
    return Intl.plural(
      amount,
      zero: 'There are no free parking spots. ',
      one: 'There is one free parking spot. ',
      other: 'There are $amount free parking spots. ',
      name: 'thereAreFreeParkingSpots',
      desc: '',
      args: [amount],
    );
  }

  String get thereIsANewAppVersion {
    return Intl.message(
      'There is a new app version available',
      name: 'thereIsANewAppVersion',
      desc: '',
      args: [],
    );
  }

  String get urlToParkomat {
    return Intl.message(
      'URL to your parkomat',
      name: 'urlToParkomat',
      desc: '',
      args: [],
    );
  }

  String get changelog {
    return Intl.message(
      'Changelog',
      name: 'changelog',
      desc: '',
      args: [],
    );
  }

  String get changelogGoBack {
    return Intl.message(
      'Okay',
      name: 'changelogGoBack',
      desc: '',
      args: [],
    );
  }

  String get installUpdateNow {
    return Intl.message(
      'Install update now.',
      name: 'installUpdateNow',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale('en', ''), Locale('de', ''),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (Locale supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}