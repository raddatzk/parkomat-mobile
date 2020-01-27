import 'package:json_annotation/json_annotation.dart' show JsonKey, JsonSerializable;

part 'asset.g.dart';

@JsonSerializable()
class Asset {
  @JsonKey(name: 'browser_download_url')
  final String url;
  @JsonKey(name: 'content_type')
  final String contentType;
  final String name;

  Asset(this.url, this.contentType, this.name);

  factory Asset.fromJson(Map<String, dynamic> json) => _$AssetFromJson(json);
  Map<String, dynamic> toJson() => _$AssetToJson(this);
}
