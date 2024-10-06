// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_hostname_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetHostnameResponse _$GetHostnameResponseFromJson(Map<String, dynamic> json) =>
    GetHostnameResponse(
      hostnameInformation: HostnameInformation.fromJson(
          json['HostnameInformation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetHostnameResponseToJson(
        GetHostnameResponse instance) =>
    <String, dynamic>{
      'HostnameInformation': instance.hostnameInformation,
    };
