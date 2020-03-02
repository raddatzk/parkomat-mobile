// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static m0(datetime) => "Last update: ${datetime}";

  static m1(amount) => "${Intl.plural(amount, zero: 'No normal ones and ', one: 'One normal one and ', other: '${amount} normal ones and ')}";

  static m2(amount) => "${Intl.plural(amount, zero: 'no on the lifts.', one: 'one on the lifts.', other: '${amount} on the lifts.')}";

  static m3(amount) => "${Intl.plural(amount, one: '1 parking spot', other: '${amount} parking spots')}";

  static m4(amount) => "${Intl.plural(amount, zero: 'There are no free parking spots. ', one: 'There is one free parking spot. ', other: 'There are ${amount} free parking spots. ')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "changelog" : MessageLookupByLibrary.simpleMessage("Changelog"),
    "changelogGoBack" : MessageLookupByLibrary.simpleMessage("Okay"),
    "checkConnection" : MessageLookupByLibrary.simpleMessage("Could not find parkomat."),
    "checkUrl" : MessageLookupByLibrary.simpleMessage("Invalid url."),
    "couldNotConnect" : MessageLookupByLibrary.simpleMessage("No internet connection."),
    "installUpdateNow" : MessageLookupByLibrary.simpleMessage("Install update now."),
    "lastUpdateAt" : m0,
    "lastUpdateLastMonth" : MessageLookupByLibrary.simpleMessage("Last update: Last month"),
    "lastUpdateLastWeek" : MessageLookupByLibrary.simpleMessage("Last update: Last week"),
    "lastUpdateLastYear" : MessageLookupByLibrary.simpleMessage("Last update: Last year"),
    "lastUpdateLongAgo" : MessageLookupByLibrary.simpleMessage("Last update: Very long ago"),
    "lastUpdateToday" : MessageLookupByLibrary.simpleMessage("Last update: Today"),
    "lastUpdateYesterday" : MessageLookupByLibrary.simpleMessage("Last update: Yesterday"),
    "normalOnesAnd" : m1,
    "onTheLifts" : m2,
    "parkingSpots" : m3,
    "sincerely" : MessageLookupByLibrary.simpleMessage("\nSincerely -- your parkomat."),
    "thereAreFreeParkingSpots" : m4,
    "thereIsANewAppVersion" : MessageLookupByLibrary.simpleMessage("There is a new app version available"),
    "urlToParkomat" : MessageLookupByLibrary.simpleMessage("URL to your parkomat")
  };
}
