// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bounds.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bounds _$BoundsFromJson(Map<String, dynamic> json) => Bounds(
      x: int.parse(json['@x'] as String),
      y: int.parse(json['@y'] as String),
      width: int.parse(json['@width'] as String),
      height: int.parse(json['@height'] as String),
    );

Map<String, dynamic> _$BoundsToJson(Bounds instance) => <String, dynamic>{
      '@x': instance.x,
      '@y': instance.y,
      '@width': instance.width,
      '@height': instance.height,
    };
