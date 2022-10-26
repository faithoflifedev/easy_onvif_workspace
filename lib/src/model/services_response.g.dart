// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetServicesResponse _$GetServicesResponseFromJson(Map<String, dynamic> json) =>
    GetServicesResponse(
      GetServicesResponse._serviceConverter(json['Service']),
    );

Map<String, dynamic> _$GetServicesResponseToJson(
        GetServicesResponse instance) =>
    <String, dynamic>{
      'Service': instance.services.map((e) => e.toJson()).toList(),
    };
