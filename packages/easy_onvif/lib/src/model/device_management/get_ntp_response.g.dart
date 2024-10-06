// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_ntp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetNtpResponse _$GetNtpResponseFromJson(Map<String, dynamic> json) =>
    GetNtpResponse(
      ntpInformation: NtpInformation.fromJson(
          json['NTPInformation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetNtpResponseToJson(GetNtpResponse instance) =>
    <String, dynamic>{
      'NTPInformation': instance.ntpInformation,
    };
