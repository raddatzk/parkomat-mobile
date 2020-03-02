import 'package:flutter/material.dart' show BuildContext, Localizations;
import 'package:intl/intl.dart' show DateFormat;
import 'package:jiffy/jiffy.dart' show Jiffy;
import 'package:parkomat/generated/l10n.dart' show S;

extension DateTimeExtension on DateTime {
  String formatLastUpdated(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime then = this.toLocal();
    String languageCode = Localizations.localeOf(context).languageCode;

    if (Jiffy(now).diff(then, "days") == 0) {
      if (languageCode == 'en_us') {
        return S.of(context).lastUpdateAt(DateFormat('h:mm a', languageCode).format(then));
      } else {
        return S.of(context).lastUpdateAt(DateFormat('H:mm', languageCode).format(then));
      }
    }

    if (Jiffy(now).diff(then, "days") == 1) {
      return S.of(context).lastUpdateYesterday;
    }

    if (Jiffy(now).diff(then, "days") < 7) {
      return DateFormat('EEEE', languageCode).format(this);
    }

    if (Jiffy(now).diff(then, "weeks") == 1) {
      return S.of(context).lastUpdateLastWeek;
    }

    if (Jiffy(now).diff(then, "months") == 1) {
      return S.of(context).lastUpdateLastMonth;
    }

    if (Jiffy(now).diff(then, "years") == 1) {
      return S.of(context).lastUpdateLastYear;
    }

    return S.of(context).lastUpdateLongAgo;
  }
}
