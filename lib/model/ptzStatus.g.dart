// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ptzStatus.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PtzStatus _$PtzStatusFromJson(Map<String, dynamic> json) => PtzStatus(
      position: PtzPosition.fromJson(json['Position'] as Map<String, dynamic>),
      xmlError: json['Error'],
      xmlUtcTime: json['UtcTime'],
    );

Map<String, dynamic> _$PtzStatusToJson(PtzStatus instance) => <String, dynamic>{
      'Position': instance.position.toJson(),
      'Error': instance.xmlError,
      'UtcTime': instance.xmlUtcTime,
    };
