// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_capabilities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaCapabilities _$MediaCapabilitiesFromJson(Map<String, dynamic> json) =>
    MediaCapabilities(
      xAddr: OnvifUtil.mappedToString(json['XAddr']),
      streamingCapabilities: RealTimeStreamingCapabilities.fromJson(
          json['StreamingCapabilities'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MediaCapabilitiesToJson(MediaCapabilities instance) =>
    <String, dynamic>{
      'XAddr': instance.xAddr,
      'StreamingCapabilities': instance.streamingCapabilities,
    };
