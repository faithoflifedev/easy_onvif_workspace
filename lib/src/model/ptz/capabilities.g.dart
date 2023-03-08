// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'capabilities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Capabilities _$CapabilitiesFromJson(Map<String, dynamic> json) => Capabilities(
      eFlip: OnvifUtil.stringToBool(json['@EFlip'] as String),
      reverse: OnvifUtil.stringToBool(json['@Reverse'] as String),
      getCompatibleConfigurations: OnvifUtil.stringToBool(
          json['@GetCompatibleConfigurations'] as String),
      moveStatus: OnvifUtil.stringToBool(json['@MoveStatus'] as String),
      moveAndTrack:
          OnvifUtil.nullableStringToList(json['@MoveAndTrack'] as String?),
    );

Map<String, dynamic> _$CapabilitiesToJson(Capabilities instance) =>
    <String, dynamic>{
      '@EFlip': instance.eFlip,
      '@Reverse': instance.reverse,
      '@GetCompatibleConfigurations': instance.getCompatibleConfigurations,
      '@MoveStatus': instance.moveStatus,
      '@MoveAndTrack': instance.moveAndTrack,
    };
