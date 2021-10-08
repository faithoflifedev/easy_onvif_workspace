// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ntpResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetNTPResponse _$GetNTPResponseFromJson(Map<String, dynamic> json) =>
    GetNTPResponse(
      ntpInformation: NtpInformation.fromJson(
          json['NTPInformation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetNTPResponseToJson(GetNTPResponse instance) =>
    <String, dynamic>{
      'NTPInformation': instance.ntpInformation.toJson(),
    };
