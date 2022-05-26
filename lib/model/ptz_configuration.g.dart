// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ptz_configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PtzConfiguration _$PtzConfigurationFromJson(Map<String, dynamic> json) =>
    PtzConfiguration(
      token: json['@token'] as String,
      name: OnvifUtil.mappedToString(json['Name'] as Map<String, dynamic>),
      useCount: OnvifUtil.mappedToInt(json['UseCount'] as Map<String, dynamic>),
      moveRamp: OnvifUtil.nullableMappedToInt(
          json['MoveRamp'] as Map<String, dynamic>?),
      presetRamp: OnvifUtil.nullableMappedToInt(
          json['PresetRamp'] as Map<String, dynamic>?),
      presetTourRamp: OnvifUtil.nullableMappedToInt(
          json['PresetTourRamp'] as Map<String, dynamic>?),
      nodeToken:
          OnvifUtil.mappedToString(json['NodeToken'] as Map<String, dynamic>),
      defaultAbsolutePantTiltPositionSpace: OnvifUtil.nullableMappedToString(
          json['DefaultAbsolutePantTiltPositionSpace']
              as Map<String, dynamic>?),
      defaultAbsoluteZoomPositionSpace: OnvifUtil.nullableMappedToString(
          json['DefaultAbsoluteZoomPositionSpace'] as Map<String, dynamic>?),
      defaultRelativePanTiltTranslationSpace: OnvifUtil.nullableMappedToString(
          json['DefaultRelativePanTiltTranslationSpace']
              as Map<String, dynamic>?),
      defaultRelativeZoomTranslationSpace: OnvifUtil.nullableMappedToString(
          json['DefaultRelativeZoomTranslationSpace'] as Map<String, dynamic>?),
      defaultContinuousPanTiltVelocitySpace: OnvifUtil.nullableMappedToString(
          json['DefaultContinuousPanTiltVelocitySpace']
              as Map<String, dynamic>?),
      defaultContinuousZoomVelocitySpace: OnvifUtil.nullableMappedToString(
          json['DefaultContinuousZoomVelocitySpace'] as Map<String, dynamic>?),
      defaultPtzSpeed: json['PtzSpeed'] == null
          ? null
          : PtzSpeed.fromJson(json['PtzSpeed'] as Map<String, dynamic>),
      defaultPtzTimeout: OnvifUtil.nullableMappedToString(
          json['DefaultPTZTimeout'] as Map<String, dynamic>?),
      panTiltLimits: json['PanTiltLimits'] == null
          ? null
          : PanTiltLimits.fromJson(
              json['PanTiltLimits'] as Map<String, dynamic>),
      zoomLimits: json['ZoomLimits'] == null
          ? null
          : ZoomLimits.fromJson(json['ZoomLimits'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PtzConfigurationToJson(PtzConfiguration instance) =>
    <String, dynamic>{
      '@token': instance.token,
      'Name': instance.name,
      'UseCount': instance.useCount,
      'MoveRamp': instance.moveRamp,
      'PresetRamp': instance.presetRamp,
      'PresetTourRamp': instance.presetTourRamp,
      'NodeToken': instance.nodeToken,
      'DefaultAbsolutePantTiltPositionSpace':
          instance.defaultAbsolutePantTiltPositionSpace,
      'DefaultAbsoluteZoomPositionSpace':
          instance.defaultAbsoluteZoomPositionSpace,
      'DefaultRelativePanTiltTranslationSpace':
          instance.defaultRelativePanTiltTranslationSpace,
      'DefaultRelativeZoomTranslationSpace':
          instance.defaultRelativeZoomTranslationSpace,
      'DefaultContinuousPanTiltVelocitySpace':
          instance.defaultContinuousPanTiltVelocitySpace,
      'DefaultContinuousZoomVelocitySpace':
          instance.defaultContinuousZoomVelocitySpace,
      'PtzSpeed': instance.defaultPtzSpeed?.toJson(),
      'DefaultPTZTimeout': instance.defaultPtzTimeout,
      'PanTiltLimits': instance.panTiltLimits?.toJson(),
      'ZoomLimits': instance.zoomLimits?.toJson(),
    };
