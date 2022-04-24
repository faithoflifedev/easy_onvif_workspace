// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ntp_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NtpInformation _$NtpInformationFromJson(Map<String, dynamic> json) =>
    NtpInformation(
      xmlFromDhcp: json['FromDHCP'] as String,
      ntpManual: NtpInformation._ntpConverter(json['NTPManual']),
      ntpFromDhcp: NtpInformation._ntpConverter(json['NTPFromDHCP']),
    );

Map<String, dynamic> _$NtpInformationToJson(NtpInformation instance) =>
    <String, dynamic>{
      'FromDHCP': instance.xmlFromDhcp,
      'NTPManual': instance.ntpManual?.map((e) => e.toJson()).toList(),
      'NTPFromDHCP': instance.ntpFromDhcp?.map((e) => e.toJson()).toList(),
    };
