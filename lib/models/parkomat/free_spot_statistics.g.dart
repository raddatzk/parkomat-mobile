// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'free_spot_statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FreeSpotStatistics _$FreeSpotStatisticsFromJson(Map<String, dynamic> json) {
  return FreeSpotStatistics(
    freeNormalSpots: (json['freeNormalPlaces'] as List)?.map((e) => e as String)?.toList(),
    freeLiftSpots: (json['freeLiftPlaces'] as List)?.map((e) => e as String)?.toList(),
    lastUpdatedMessage: json['lastUpdated'] as String,
  );
}

Map<String, dynamic> _$FreeSpotStatisticsToJson(FreeSpotStatistics instance) => <String, dynamic>{
      'freeLiftPlaces': instance.freeLiftSpots,
      'freeNormalPlaces': instance.freeNormalSpots,
      'lastUpdated': instance.lastUpdatedMessage,
    };
