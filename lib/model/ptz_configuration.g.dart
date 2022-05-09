// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ptz_configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PtzConfiguration _$PtzConfigurationFromJson(Map<String, dynamic> json) =>
    PtzConfiguration(
      token: json['@token'] as String,
      xmlName: json['Name'],
      xmlUseCount: json['UseCount'],
      xmlMoveRamp: json['MoveRamp'],
      xmlPresetRamp: json['PresetRamp'],
      xmlPresetTourRamp: json['PresetTourRamp'],
      xmlNodeToken: json['NodeToken'],
      xmlDefaultAbsolutePantTiltPositionSpace:
          json['DefaultAbsolutePantTiltPositionSpace'],
      xmlDefaultAbsoluteZoomPositionSpace:
          json['DefaultAbsoluteZoomPositionSpace'],
      xmlDefaultRelativePanTiltTranslationSpace:
          json['DefaultRelativePanTiltTranslationSpace'],
      xmlDefaultRelativeZoomTranslationSpace:
          json['DefaultRelativeZoomTranslationSpace'],
      xmlDefaultContinuousPanTiltVelocitySpace:
          json['DefaultContinuousPanTiltVelocitySpace'],
      xmlDefaultContinuousZoomVelocitySpace:
          json['DefaultContinuousZoomVelocitySpace'],
      defaultPTZSpeed: json['PtzSpeed'] == null
          ? null
          : PtzSpeed.fromJson(json['PtzSpeed'] as Map<String, dynamic>),
      xmlDefaultPTZTimeout: json['DefaultPTZTimeout'],
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
      'Name': instance.xmlName,
      'UseCount': instance.xmlUseCount,
      'MoveRamp': instance.xmlMoveRamp,
      'PresetRamp': instance.xmlPresetRamp,
      'PresetTourRamp': instance.xmlPresetTourRamp,
      'NodeToken': instance.xmlNodeToken,
      'DefaultAbsolutePantTiltPositionSpace':
          instance.xmlDefaultAbsolutePantTiltPositionSpace,
      'DefaultAbsoluteZoomPositionSpace':
          instance.xmlDefaultAbsoluteZoomPositionSpace,
      'DefaultRelativePanTiltTranslationSpace':
          instance.xmlDefaultRelativePanTiltTranslationSpace,
      'DefaultRelativeZoomTranslationSpace':
          instance.xmlDefaultRelativeZoomTranslationSpace,
      'DefaultContinuousPanTiltVelocitySpace':
          instance.xmlDefaultContinuousPanTiltVelocitySpace,
      'DefaultContinuousZoomVelocitySpace':
          instance.xmlDefaultContinuousZoomVelocitySpace,
      'PtzSpeed': instance.defaultPTZSpeed?.toJson(),
      'DefaultPTZTimeout': instance.xmlDefaultPTZTimeout,
      'PanTiltLimits': instance.panTiltLimits?.toJson(),
      'ZoomLimits': instance.zoomLimits?.toJson(),
    };
