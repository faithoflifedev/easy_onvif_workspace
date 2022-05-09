import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'ptz_speed.dart';
import 'pan_tilt_limits.dart';
import 'zoom_limits.dart';

part 'ptz_configuration.g.dart';

///A specific PTZconfiguration from the device.
///
///The default Position/Translation/Velocity Spaces are introduced to allow NVCs
///sending move requests without the need to specify a certain coordinate
///system. The default Speeds are introduced to control the speed of move
///requests (absolute, relative, preset), where no explicit speed has been set.
///
///The allowed pan and tilt range for Pan/Tilt Limits is defined by a
///two-dimensional space range that is mapped to a specific Absolute Pan/Tilt
///Position Space. At least one Pan/Tilt Position Space is required by the
///PTZNode to support Pan/Tilt limits. The limits apply to all supported
///absolute, relative and continuous Pan/Tilt movements. The limits shall be
///checked within the coordinate system for which the limits have been
///specified. That means that even if movements are specified in a different
///coordinate system, the requested movements shall be transformed to the
///coordinate system of the limits where the limits can be checked. When a
///relative or continuous movements is specified, which would leave the
///specified limits, the PTZ unit has to move along the specified limits.
@JsonSerializable(explicitToJson: true)
class PtzConfiguration {
  ///Capability information.
  @JsonKey(name: '@token')
  final String token;

  @JsonKey(name: 'Name')
  final dynamic xmlName;

  @JsonKey(name: 'UseCount')
  final dynamic xmlUseCount;

  @JsonKey(name: 'MoveRamp')
  final dynamic xmlMoveRamp;

  @JsonKey(name: 'PresetRamp')
  final dynamic xmlPresetRamp;

  @JsonKey(name: 'PresetTourRamp')
  final dynamic xmlPresetTourRamp;

  @JsonKey(name: 'NodeToken')
  final dynamic xmlNodeToken;

  @JsonKey(name: 'DefaultAbsolutePantTiltPositionSpace')
  final dynamic xmlDefaultAbsolutePantTiltPositionSpace;

  @JsonKey(name: 'DefaultAbsoluteZoomPositionSpace')
  final dynamic xmlDefaultAbsoluteZoomPositionSpace;

  @JsonKey(name: 'DefaultRelativePanTiltTranslationSpace')
  final dynamic xmlDefaultRelativePanTiltTranslationSpace;

  @JsonKey(name: 'DefaultRelativeZoomTranslationSpace')
  final dynamic xmlDefaultRelativeZoomTranslationSpace;

  @JsonKey(name: 'DefaultContinuousPanTiltVelocitySpace')
  final dynamic xmlDefaultContinuousPanTiltVelocitySpace;

  @JsonKey(name: 'DefaultContinuousZoomVelocitySpace')
  final dynamic xmlDefaultContinuousZoomVelocitySpace;

  @JsonKey(name: 'PtzSpeed')
  final PtzSpeed? defaultPTZSpeed;

  @JsonKey(name: 'DefaultPTZTimeout')
  final dynamic xmlDefaultPTZTimeout;

  @JsonKey(name: 'PanTiltLimits')
  final PanTiltLimits? panTiltLimits;

  @JsonKey(name: 'ZoomLimits')
  final ZoomLimits? zoomLimits;

  PtzConfiguration(
      {required this.token,
      required this.xmlName,
      required this.xmlUseCount,
      this.xmlMoveRamp,
      this.xmlPresetRamp,
      this.xmlPresetTourRamp,
      required this.xmlNodeToken,
      this.xmlDefaultAbsolutePantTiltPositionSpace,
      this.xmlDefaultAbsoluteZoomPositionSpace,
      this.xmlDefaultRelativePanTiltTranslationSpace,
      this.xmlDefaultRelativeZoomTranslationSpace,
      this.xmlDefaultContinuousPanTiltVelocitySpace,
      this.xmlDefaultContinuousZoomVelocitySpace,
      this.defaultPTZSpeed,
      this.xmlDefaultPTZTimeout,
      this.panTiltLimits,
      this.zoomLimits});

  String get name => xmlName['\$'];

  int get useCount => int.parse(xmlUseCount['\$']);

  String get moveRamp => xmlMoveRamp['\$'];

  int get presetRamp => int.parse(xmlPresetRamp['\$']);

  int get presetTourRamp => int.parse(xmlPresetTourRamp['\$']);

  String get nodeToken => xmlNodeToken['\$'];

  String get defaultAbsolutePantTiltPositionSpace =>
      xmlDefaultAbsolutePantTiltPositionSpace['\$'];

  String get defaultAbsoluteZoomPositionSpace =>
      xmlDefaultAbsoluteZoomPositionSpace['\$'];

  String get defaultRelativePanTiltTranslationSpace =>
      xmlDefaultRelativePanTiltTranslationSpace['\$'];

  String get defaultRelativeZoomTranslationSpace =>
      xmlDefaultRelativeZoomTranslationSpace['\$'];

  String get defaultContinuousPanTiltVelocitySpace =>
      xmlDefaultContinuousPanTiltVelocitySpace['\$'];

  String get defaultContinuousZoomVelocitySpace =>
      xmlDefaultContinuousZoomVelocitySpace['\$'];

  String get defaultPTZTimeout => xmlDefaultPTZTimeout['\$'];

  factory PtzConfiguration.fromJson(Map<String, dynamic> json) =>
      _$PtzConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$PtzConfigurationToJson(this);

  @override
  String toString() => json.encode(toJson());
}
