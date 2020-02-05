import 'package:json_annotation/json_annotation.dart' show JsonKey, JsonSerializable;

part 'free_spot_statistics.g.dart';

@JsonSerializable()
class FreeSpotStatistics {
  @JsonKey(name: "freeLiftPlaces")
  List<String> freeLiftSpots;
  @JsonKey(name: "freeNormalPlaces")
  List<String> freeNormalSpots;
  @JsonKey(name: "lastUpdated")
  DateTime lastUpdated;

  int get freeSpots => freeLiftSpots.length + freeNormalSpots.length;

  FreeSpotStatistics({this.freeNormalSpots, this.freeLiftSpots, this.lastUpdated});

  factory FreeSpotStatistics.fromJson(Map<String, dynamic> json) => _$FreeSpotStatisticsFromJson(json);
  Map<String, dynamic> toJson() => _$FreeSpotStatisticsToJson(this);
}
