// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imaging_preset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImagingPreset _$ImagingPresetFromJson(Map<String, dynamic> json) =>
    ImagingPreset(
      token: json['@token'] as String,
      type: OnvifUtil.mappedToString(json['type']),
      name: OnvifUtil.mappedToString(json['name']),
    );

Map<String, dynamic> _$ImagingPresetToJson(ImagingPreset instance) =>
    <String, dynamic>{
      '@token': instance.token,
      'type': instance.type,
      'name': instance.name,
    };
