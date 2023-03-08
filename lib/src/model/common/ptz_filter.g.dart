// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ptz_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PtzFilter _$PtzFilterFromJson(Map<String, dynamic> json) => PtzFilter(
      status: OnvifUtil.mappedToBool(json['Status'] as Map<String, dynamic>),
      position:
          OnvifUtil.mappedToBool(json['Position'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PtzFilterToJson(PtzFilter instance) => <String, dynamic>{
      'Status': instance.status,
      'Position': instance.position,
    };
