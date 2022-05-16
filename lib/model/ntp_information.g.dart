// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ntp_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NtpInformation _$NtpInformationFromJson(Map<String, dynamic> json) =>
    NtpInformation(
      fromDhcp:
          OnvifUtil.mappedToBool(json['FromDHCP'] as Map<String, dynamic>),
      ntpManual: NtpInformation._nullableNtpConverter(json['NTPManual']),
      ntpFromDhcp: NtpInformation._nullableNtpConverter(json['NTPFromDHCP']),
    );

Map<String, dynamic> _$NtpInformationToJson(NtpInformation instance) =>
    <String, dynamic>{
      'FromDHCP': instance.fromDhcp,
      'NTPManual': instance.ntpManual?.map((e) => e.toJson()).toList(),
      'NTPFromDHCP': instance.ntpFromDhcp?.map((e) => e.toJson()).toList(),
    };
