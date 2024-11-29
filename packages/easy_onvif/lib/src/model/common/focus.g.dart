// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'focus.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Focus _$FocusFromJson(Map<String, dynamic> json) => Focus(
      autoFocusMode: Focus.mappedToAutoFocusMode(
          json['AutoFocusMode'] as Map<String, dynamic>),
      defaultSpeed: OnvifUtil.nullableDoubleMappedFromXml(
          json['DefaultSpeed'] as Map<String, dynamic>?),
      nearLimit: OnvifUtil.nullableDoubleMappedFromXml(
          json['NearLimit'] as Map<String, dynamic>?),
      farLimit: OnvifUtil.nullableDoubleMappedFromXml(
          json['FarLimit'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$FocusToJson(Focus instance) => <String, dynamic>{
      'AutoFocusMode': _$AutoFocusModeEnumMap[instance.autoFocusMode]!,
      'DefaultSpeed': instance.defaultSpeed,
      'NearLimit': instance.nearLimit,
      'FarLimit': instance.farLimit,
    };

const _$AutoFocusModeEnumMap = {
  AutoFocusMode.auto: 'auto',
  AutoFocusMode.manual: 'manual',
};
