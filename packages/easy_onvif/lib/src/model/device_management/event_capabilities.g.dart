// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_capabilities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventCapabilities _$EventCapabilitiesFromJson(Map<String, dynamic> json) =>
    EventCapabilities(
      OnvifUtil.stringMappedFromXml(json['XAddr'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EventCapabilitiesToJson(EventCapabilities instance) =>
    <String, dynamic>{
      'XAddr': instance.xAddr,
    };
