// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hostname_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HostnameInformation _$HostnameInformationFromJson(Map<String, dynamic> json) =>
    HostnameInformation(
      fromDhcp: OnvifUtil.mappedToString(json['FromDHCP']),
      name: OnvifUtil.mappedToString(json['Name']),
    );

Map<String, dynamic> _$HostnameInformationToJson(
        HostnameInformation instance) =>
    <String, dynamic>{
      'FromDHCP': instance.fromDhcp,
      'Name': instance.name,
    };
