// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imaging_capabilities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImagingCapabilities _$ImagingCapabilitiesFromJson(Map<String, dynamic> json) =>
    ImagingCapabilities(
      xAddr:
          OnvifUtil.stringMappedFromXml(json['XAddr'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ImagingCapabilitiesToJson(
        ImagingCapabilities instance) =>
    <String, dynamic>{
      'XAddr': instance.xAddr,
    };
