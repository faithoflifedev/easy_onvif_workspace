// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'endpoint_reference.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EndpointReference _$EndpointReferenceFromJson(Map<String, dynamic> json) =>
    EndpointReference(
      address:
          OnvifUtil.mappedToString(json['Address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EndpointReferenceToJson(EndpointReference instance) =>
    <String, dynamic>{
      'Address': instance.address,
    };
