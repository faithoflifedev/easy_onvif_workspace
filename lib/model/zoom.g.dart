// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zoom.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Zoom _$ZoomFromJson(Map<String, dynamic> json) {
  return Zoom(
    rawX: json['@x'] as String,
    space: json['@space'] as String?,
  );
}

Map<String, dynamic> _$ZoomToJson(Zoom instance) => <String, dynamic>{
      '@x': instance.rawX,
      '@space': instance.space,
    };
