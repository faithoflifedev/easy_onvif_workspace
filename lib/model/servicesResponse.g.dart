// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'servicesResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetServicesResponse _$GetServicesResponseFromJson(Map<String, dynamic> json) =>
    GetServicesResponse(
      GetServicesResponse._serviceConverter(json['Services']),
    );

Map<String, dynamic> _$GetServicesResponseToJson(
        GetServicesResponse instance) =>
    <String, dynamic>{
      'Services': instance.services.map((e) => e.toJson()).toList(),
    };
