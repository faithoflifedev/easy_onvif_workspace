// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zoom.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Zoom _$ZoomFromJson(Map<String, dynamic> json) => Zoom(
      x: double.parse(json['@x'] as String),
      space: json['@space'] as String?,
    );

Map<String, dynamic> _$ZoomToJson(Zoom instance) => <String, dynamic>{
      '@x': instance.x,
      '@space': instance.space,
    };
