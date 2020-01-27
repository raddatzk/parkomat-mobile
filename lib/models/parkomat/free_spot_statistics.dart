import 'package:json_annotation/json_annotation.dart' show JsonKey, JsonSerializable;

part 'free_spot_statistics.g.dart';

@JsonSerializable()
class FreeSpotStatistics {
  List<String> freeLiftSpots;
  List<String> freeNormalSpots;
  @JsonKey(name: "lastUpdated")
  String lastUpdatedMessage;

  int get freeSpots => freeLiftSpots.length + freeNormalSpots.length;

  DateTime get lastUpdated => DateTime.parse(lastUpdatedMessage.split("Last Updated: ")[1] + "-01:00");

  FreeSpotStatistics({this.freeNormalSpots, this.freeLiftSpots, this.lastUpdatedMessage});

  factory FreeSpotStatistics.fromJson(Map<String, dynamic> json) => _$FreeSpotStatisticsFromJson(json);
  Map<String, dynamic> toJson() => _$FreeSpotStatisticsToJson(this);
}
