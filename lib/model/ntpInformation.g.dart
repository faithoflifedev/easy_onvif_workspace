// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ntpInformation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NtpInformation _$NtpInformationFromJson(Map<String, dynamic> json) {
  return NtpInformation(
    xmlFromDhcp: json['FromDHCP'] as String,
    ntpManual: json['NTPManual'] == null
        ? null
        : Ntp.fromJson(json['NTPManual'] as Map<String, dynamic>),
    ntpFromDhcp: json['NTPFromDHCP'] == null
        ? null
        : Ntp.fromJson(json['NTPFromDHCP'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NtpInformationToJson(NtpInformation instance) =>
    <String, dynamic>{
      'FromDHCP': instance.xmlFromDhcp,
      'NTPManual': instance.ntpManual?.toJson(),
      'NTPFromDHCP': instance.ntpFromDhcp?.toJson(),
    };
