// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pan_tilt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PanTilt _$PanTiltFromJson(Map<String, dynamic> json) => PanTilt(
      x: num.parse(json['@x'] as String),
      y: num.parse(json['@y'] as String),
      space: json['@space'] as String?,
    );

Map<String, dynamic> _$PanTiltToJson(PanTilt instance) => <String, dynamic>{
      '@x': instance.x,
      '@y': instance.y,
      '@space': instance.space,
    };
