// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Asset _$AssetFromJson(Map<String, dynamic> json) {
  return Asset(
    json['browser_download_url'] as String,
    json['content_type'] as String,
    json['name'] as String,
  );
}

Map<String, dynamic> _$AssetToJson(Asset instance) => <String, dynamic>{
      'browser_download_url': instance.url,
      'content_type': instance.contentType,
      'name': instance.name,
    };
