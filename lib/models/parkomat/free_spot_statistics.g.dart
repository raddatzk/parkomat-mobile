// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'free_spot_statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FreeSpotStatistics _$FreeSpotStatisticsFromJson(Map<String, dynamic> json) {
  return FreeSpotStatistics(
    freeNormalSpots:
        (json['freeNormalSpots'] as List)?.map((e) => e as String)?.toList(),
    freeLiftSpots:
        (json['freeLiftSpots'] as List)?.map((e) => e as String)?.toList(),
    lastUpdatedMessage: json['lastUpdated'] as String,
  );
}

Map<String, dynamic> _$FreeSpotStatisticsToJson(FreeSpotStatistics instance) =>
    <String, dynamic>{
      'freeLiftSpots': instance.freeLiftSpots,
      'freeNormalSpots': instance.freeNormalSpots,
      'lastUpdated': instance.lastUpdatedMessage,
    };
