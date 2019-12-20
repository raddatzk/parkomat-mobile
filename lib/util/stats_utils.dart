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
  return sprintf("%d %s", [freeLiftSpots, S.of(context).standard]);
}

String _normalStatsDescription(int freeNormalSpots, BuildContext context) {
  return sprintf("%d %s", [freeNormalSpots, S.of(context).onTheLifts]);
}

String statsDescription(FreeSpotStatistics stats, BuildContext context) {
  int freeNormalSpots = stats.freeNormalPlaces.length;
  int freeLiftSpots = stats.freeLiftPlaces.length;
  String freeNormalSpotsDetails;
  if (freeNormalSpots == 0) {
    freeNormalSpotsDetails = "";
  } else if (freeNormalSpots == 1) {
    freeNormalSpotsDetails = S.of(context).oneStandard;
  } else {
    freeNormalSpotsDetails = _liftStatsDescription(freeLiftSpots, context);
  }
  String freeLiftSpotsDetails;
  if (freeLiftSpots == 0) {
    freeLiftSpotsDetails = "";
  } else if (freeLiftSpots == 1) {
    freeLiftSpotsDetails = S.of(context).one;
  } else {
    freeLiftSpotsDetails = _normalStatsDescription(freeNormalSpots, context);
  }

  return S.of(context).statsDescription(freeNormalSpotsDetails, freeLiftSpotsDetails);
}