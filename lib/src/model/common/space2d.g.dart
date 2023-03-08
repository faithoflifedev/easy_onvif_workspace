// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'space2d.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Space2D _$Space2DFromJson(Map<String, dynamic> json) => Space2D(
      uri: OnvifUtil.mappedToString(json['URI'] as Map<String, dynamic>),
      xRange: Space.fromJson(json['XRange'] as Map<String, dynamic>),
      yRange: Space.fromJson(json['YRange'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$Space2DToJson(Space2D instance) => <String, dynamic>{
      'URI': instance.uri,
      'XRange': instance.xRange,
      'YRange': instance.yRange,
    };
