// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_date_time_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSystemDateAndTimeResponse _$GetSystemDateAndTimeResponseFromJson(
        Map<String, dynamic> json) =>
    GetSystemDateAndTimeResponse(
      SystemDateAndTime.fromJson(
          json['SystemDateAndTime'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetSystemDateAndTimeResponseToJson(
        GetSystemDateAndTimeResponse instance) =>
    <String, dynamic>{
      'SystemDateAndTime': instance.systemDateAndTime.toJson(),
    };
