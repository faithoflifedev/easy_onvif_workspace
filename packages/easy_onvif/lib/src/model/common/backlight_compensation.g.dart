// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backlight_compensation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BacklightCompensation _$BacklightCompensationFromJson(
        Map<String, dynamic> json) =>
    BacklightCompensation(
      mode: OnvifUtil.mappedToString(json['Mode']),
      level: OnvifUtil.nullableMappedToDouble(
          json['Level'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$BacklightCompensationToJson(
        BacklightCompensation instance) =>
    <String, dynamic>{
      'Mode': instance.mode,
      'Level': instance.level,
    };
