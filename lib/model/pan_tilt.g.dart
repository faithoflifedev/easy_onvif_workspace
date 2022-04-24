// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pan_tilt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PanTilt _$PanTiltFromJson(Map<String, dynamic> json) => PanTilt(
      rawX: json['@x'] as String,
      rawY: json['@y'] as String,
      space: json['@space'] as String?,
    );

Map<String, dynamic> _$PanTiltToJson(PanTilt instance) => <String, dynamic>{
      '@x': instance.rawX,
      '@y': instance.rawY,
      '@space': instance.space,
    };
