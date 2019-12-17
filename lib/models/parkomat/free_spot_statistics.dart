import 'package:json_annotation/json_annotation.dart';

part 'free_spot_statistics.g.dart';

@JsonSerializable()
class FreeSpotStatistics {
  List<String> freeLiftPlaces;
  List<String> freeNormalPlaces;
  String lastUpdated;

  FreeSpotStatistics({this.freeNormalPlaces, this.freeLiftPlaces, this.lastUpdated});

  factory FreeSpotStatistics.fromJson(Map<String, dynamic> json) => _$FreeSpotStatisticsFromJson(json);
  Map<String, dynamic> toJson() => _$FreeSpotStatisticsToJson(this);
}
