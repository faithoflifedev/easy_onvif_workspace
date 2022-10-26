// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'focus.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Focus _$FocusFromJson(Map<String, dynamic> json) => Focus(
      autoFocusMode: OnvifUtil.mappedToString(
          json['AutoFocusMode'] as Map<String, dynamic>),
      defaultSpeed: OnvifUtil.mappedToDouble(
          json['DefaultSpeed'] as Map<String, dynamic>),
      nearLimit:
          OnvifUtil.mappedToDouble(json['NearLimit'] as Map<String, dynamic>),
      farLimit:
          OnvifUtil.mappedToDouble(json['FarLimit'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FocusToJson(Focus instance) => <String, dynamic>{
      'AutoFocusMode': instance.autoFocusMode,
      'DefaultSpeed': instance.defaultSpeed,
      'NearLimit': instance.nearLimit,
      'FarLimit': instance.farLimit,
    };
