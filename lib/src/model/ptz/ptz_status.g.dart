// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ptz_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PtzStatus _$PtzStatusFromJson(Map<String, dynamic> json) => PtzStatus(
      position: PtzPosition.fromJson(json['Position'] as Map<String, dynamic>),
      error: OnvifUtil.nullableMappedToString(
          json['Error'] as Map<String, dynamic>?),
      utcTime: OnvifUtil.nullableMappedToDateTime(
          json['UtcTime'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$PtzStatusToJson(PtzStatus instance) => <String, dynamic>{
      'Position': instance.position,
      'Error': instance.error,
      'UtcTime': instance.utcTime?.toIso8601String(),
    };
