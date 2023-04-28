// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imaging_preset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImagingPreset _$ImagingPresetFromJson(Map<String, dynamic> json) =>
    ImagingPreset(
      token: json['@token'] as String,
      type: OnvifUtil.mappedToString(json['type'] as Map<String, dynamic>),
      name: OnvifUtil.mappedToString(json['name'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ImagingPresetToJson(ImagingPreset instance) =>
    <String, dynamic>{
      '@token': instance.token,
      'type': instance.type,
      'name': instance.name,
    };
