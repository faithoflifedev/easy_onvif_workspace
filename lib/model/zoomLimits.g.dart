// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zoomLimits.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ZoomLimits _$ZoomLimitsFromJson(Map<String, dynamic> json) => ZoomLimits(
      range: Space1D.fromJson(json['Range'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ZoomLimitsToJson(ZoomLimits instance) =>
    <String, dynamic>{
      'Range': instance.range.toJson(),
    };
