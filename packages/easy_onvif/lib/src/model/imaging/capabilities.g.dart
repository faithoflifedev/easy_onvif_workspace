// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'capabilities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Capabilities _$CapabilitiesFromJson(Map<String, dynamic> json) => Capabilities(
  imageStabilization: OnvifUtil.stringToBool(
    json['@ImageStabilization'] as String,
  ),
  presets: OnvifUtil.optionalBool(json['@Presets'] as String?),
  adaptablePreset: OnvifUtil.optionalBool(json['@AdaptablePreset'] as String?),
);

Map<String, dynamic> _$CapabilitiesToJson(Capabilities instance) =>
    <String, dynamic>{
      '@ImageStabilization': instance.imageStabilization,
      '@Presets': instance.presets,
      '@AdaptablePreset': instance.adaptablePreset,
    };
