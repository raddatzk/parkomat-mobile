import 'package:json_annotation/json_annotation.dart';

import 'asset.dart';

part 'release.g.dart';

@JsonSerializable()
class Release {
  @JsonKey(name: 'tag_name')
  final String tagName;

  final String name;

  final List<Asset> assets;

  final String body;

  Release(this.tagName, this.assets, this.name, this.body);

  factory Release.fromJson(Map<String, dynamic> json) => _$ReleaseFromJson(json);
  Map<String, dynamic> toJson() => _$ReleaseToJson(this);
}
