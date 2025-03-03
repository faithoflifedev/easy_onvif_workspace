// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ntp_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NtpInformation _$NtpInformationFromJson(Map<String, dynamic> json) =>
    NtpInformation(
      fromDhcp: OnvifUtil.boolMappedFromXml(
        json['FromDHCP'] as Map<String, dynamic>,
      ),
      ntpManual: NtpInformation._nullableUnbound(json['NTPManual']),
      ntpFromDhcp: NtpInformation._nullableUnbound(json['NTPFromDHCP']),
    );

Map<String, dynamic> _$NtpInformationToJson(NtpInformation instance) =>
    <String, dynamic>{
      'FromDHCP': instance.fromDhcp,
      'NTPManual': instance.ntpManual,
      'NTPFromDHCP': instance.ntpFromDhcp,
    };
