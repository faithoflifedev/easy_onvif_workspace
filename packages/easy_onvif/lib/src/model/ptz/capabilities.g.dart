// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'capabilities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Capabilities _$CapabilitiesFromJson(Map<String, dynamic> json) => Capabilities(
  eFlip: OnvifUtil.nullableStringToBool(json['@EFlip'] as String?),
  reverse: OnvifUtil.nullableStringToBool(json['@Reverse'] as String?),
  getCompatibleConfigurations: OnvifUtil.nullableStringToBool(
    json['@GetCompatibleConfigurations'] as String?,
  ),
  moveStatus: OnvifUtil.nullableStringToBool(json['@MoveStatus'] as String?),
  moveAndTrack: OnvifUtil.nullableStringToList(
    json['@MoveAndTrack'] as String?,
  ),
);

Map<String, dynamic> _$CapabilitiesToJson(Capabilities instance) =>
    <String, dynamic>{
      '@EFlip': instance.eFlip,
      '@Reverse': instance.reverse,
      '@GetCompatibleConfigurations': instance.getCompatibleConfigurations,
      '@MoveStatus': instance.moveStatus,
      '@MoveAndTrack': instance.moveAndTrack,
    };
