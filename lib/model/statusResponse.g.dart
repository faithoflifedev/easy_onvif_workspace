// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statusResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetStatusResponse _$GetStatusResponseFromJson(Map<String, dynamic> json) =>
    GetStatusResponse(
      ptzStatus: PtzStatus.fromJson(json['PTZStatus'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetStatusResponseToJson(GetStatusResponse instance) =>
    <String, dynamic>{
      'PTZStatus': instance.ptzStatus.toJson(),
    };
