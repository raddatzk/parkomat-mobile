// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a de locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'de';

  static m0(datetime) => "Letztes Update: ${datetime}";

  static m1(amount) => "${Intl.plural(amount, zero: 'Keine normale und ', one: 'Einen normalen und ', other: '${amount} normale und ')}";

  static m2(amount) => "${Intl.plural(amount, zero: 'keine auf den Hebebühnen.', one: 'einen auf den Hebebühnen.', other: '${amount} auf den Hebebühnen.')}";

  static m3(amount) => "${Intl.plural(amount, one: '1 Parkplatz', other: '${amount} Parkplätze')}";

  static m4(amount) => "${Intl.plural(amount, zero: 'Es gibt keine freien Parkplätze. ', one: 'Es gibt einen freien Parkplatz. ', other: 'Es gibt ${amount} freie Parkplätze. ')}";

  static m5(version) => "Es gibt eine neue Version der App: ${version}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "couldNotConnect" : MessageLookupByLibrary.simpleMessage("Konnte keine Verbindung aufbauen."),
    "couldNotFetchStatsFromParkomat" : MessageLookupByLibrary.simpleMessage("Konnte keine Daten abrufen."),
    "lastUpdateAt" : m0,
    "lastUpdateLastMonth" : MessageLookupByLibrary.simpleMessage("Letztes Update: Letzter Monat"),
    "lastUpdateLastWeek" : MessageLookupByLibrary.simpleMessage("Letztes Update: Letzte Woche"),
    "lastUpdateLastYear" : MessageLookupByLibrary.simpleMessage("Letztes Update: Letztes Jahr"),
    "lastUpdateLongAgo" : MessageLookupByLibrary.simpleMessage("Letztes Update: Vor sehr langer Zeit"),
    "lastUpdateToday" : MessageLookupByLibrary.simpleMessage("Letztes Update: Heute"),
    "lastUpdateYesterday" : MessageLookupByLibrary.simpleMessage("Letztes Update: Gestern"),
    "normalOnesAnd" : m1,
    "offline" : MessageLookupByLibrary.simpleMessage("OFFLINE"),
    "onTheLifts" : m2,
    "online" : MessageLookupByLibrary.simpleMessage("ONLINE"),
    "parkingSpots" : m3,
    "sincerely" : MessageLookupByLibrary.simpleMessage("\nMit freundlichen Grüßen -- dein Parkomat."),
    "thereAreFreeParkingSpots" : m4,
    "thereIsANewAppVersion" : m5,
    "urlToParkomat" : MessageLookupByLibrary.simpleMessage("URL zum Parkomat")
  };
}
