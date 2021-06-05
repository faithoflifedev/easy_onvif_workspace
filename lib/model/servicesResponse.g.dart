// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'servicesResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetServicesResponse _$GetServicesResponseFromJson(Map<String, dynamic> json) {
  return GetServicesResponse(
    (json['Services'] as List<dynamic>)
        .map((e) => Service.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$GetServicesResponseToJson(
        GetServicesResponse instance) =>
    <String, dynamic>{
      'Services': instance.services.map((e) => e.toJson()).toList(),
    };
