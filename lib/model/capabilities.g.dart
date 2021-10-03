// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'capabilities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Capabilities _$CapabilitiesFromJson(Map<String, dynamic> json) {
  return Capabilities(
    json['Analytics'] == null
        ? null
        : Analytics.fromJson(json['Analytics'] as Map<String, dynamic>),
    json['Device'] == null
        ? null
        : Device.fromJson(json['Device'] as Map<String, dynamic>),
    Media.fromJson(json['Media'] as Map<String, dynamic>),
    json['Events'] == null
        ? null
        : Events.fromJson(json['Events'] as Map<String, dynamic>),
    Ptz.fromJson(json['PTZ'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CapabilitiesToJson(Capabilities instance) =>
    <String, dynamic>{
      'Analytics': instance.analytics?.toJson(),
      'Device': instance.device?.toJson(),
      'Media': instance.media.toJson(),
      'Events': instance.events?.toJson(),
      'PTZ': instance.ptz.toJson(),
    };
