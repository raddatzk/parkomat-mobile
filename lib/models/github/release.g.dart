// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'release.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Release _$ReleaseFromJson(Map<String, dynamic> json) {
  return Release(
    json['tag_name'] as String,
    (json['assets'] as List)
        ?.map(
            (e) => e == null ? null : Asset.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['name'] as String,
    json['body'] as String,
  );
}

Map<String, dynamic> _$ReleaseToJson(Release instance) => <String, dynamic>{
      'tag_name': instance.tagName,
      'name': instance.name,
      'assets': instance.assets,
      'body': instance.body,
    };
