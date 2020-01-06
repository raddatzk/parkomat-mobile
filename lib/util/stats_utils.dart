import 'package:flutter/cupertino.dart';
import 'package:parkomat/generated/i18n.dart';
import 'package:parkomat/models/parkomat/free_spot_statistics.dart';
import 'package:sprintf/sprintf.dart';

String statsTitle(FreeSpotStatistics stats, BuildContext context) {
  int totalFreeSpots = stats.freeLiftPlaces.length + stats.freeNormalPlaces.length;

  return sprintf("%d %s", [totalFreeSpots, S.of(context).parkingSpots]);
}

String statsShareTitle(FreeSpotStatistics stats, BuildContext context) {
  int totalFreeSpots = stats.freeLiftPlaces.length + stats.freeNormalPlaces.length;

  return S.of(context).statsShareTitle(totalFreeSpots.toString());
}

String _liftStatsDescription(int freeLiftSpots, BuildContext context) {
  return sprintf("%d %s", [freeLiftSpots, S.of(context).onTheLifts]);
}

String _normalStatsDescription(int freeNormalSpots, BuildContext context) {
  return sprintf("%d %s", [freeNormalSpots, S.of(context).standard]);
}

String statsDescription(FreeSpotStatistics stats, BuildContext context) {
  int freeNormalSpots = stats.freeNormalPlaces.length;
  int freeLiftSpots = stats.freeLiftPlaces.length;
  String freeNormalSpotsDetails;
  freeNormalSpotsDetails = _normalStatsDescription(freeLiftSpots, context);
  String freeLiftSpotsDetails;
  freeLiftSpotsDetails = _liftStatsDescription(freeNormalSpots, context);

  return S.of(context).statsDescription(freeNormalSpotsDetails, freeLiftSpotsDetails);
}
