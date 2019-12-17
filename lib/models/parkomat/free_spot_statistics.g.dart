// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'free_spot_statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FreeSpotStatistics _$FreeSpotStatisticsFromJson(Map<String, dynamic> json) {
  return FreeSpotStatistics(
    freeNormalPlaces:
        (json['freeNormalPlaces'] as List)?.map((e) => e as String)?.toList(),
    freeLiftPlaces:
        (json['freeLiftPlaces'] as List)?.map((e) => e as String)?.toList(),
    lastUpdated: json['lastUpdated'] as String,
  );
}

Map<String, dynamic> _$FreeSpotStatisticsToJson(FreeSpotStatistics instance) =>
    <String, dynamic>{
      'freeLiftPlaces': instance.freeLiftPlaces,
      'freeNormalPlaces': instance.freeNormalPlaces,
      'lastUpdated': instance.lastUpdated,
    };
