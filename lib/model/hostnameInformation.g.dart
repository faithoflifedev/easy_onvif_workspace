// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hostnameInformation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HostnameInformation _$HostnameInformationFromJson(Map<String, dynamic> json) {
  return HostnameInformation(
    xmlFromDhcp: json['FromDHCP'],
    xmlName: json['Name'],
  );
}

Map<String, dynamic> _$HostnameInformationToJson(
        HostnameInformation instance) =>
    <String, dynamic>{
      'FromDHCP': instance.xmlFromDhcp,
      'Name': instance.xmlName,
    };
