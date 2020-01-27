import 'package:flutter/material.dart';
import 'package:parkomat/generated/l10n.dart' show S;
import 'package:parkomat/models/parkomat/free_spot_statistics.dart' show FreeSpotStatistics;

String statsSummary(FreeSpotStatistics stats, BuildContext context) {
  return S.of(context).thereAreFreeParkingSpots(stats.freeSpots);
}

String statsDetails(FreeSpotStatistics stats, BuildContext context) {
  String normal = S.of(context).normalOnesAnd(stats.freeNormalSpots.length);
  String lift = S.of(context).onTheLifts(stats.freeLiftSpots.length);

  return normal + lift;
}

String shareMessageGreeting(BuildContext context) {
  return S.of(context).sincerely;
}
