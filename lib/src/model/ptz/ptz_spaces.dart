import 'dart:convert';

import 'package:easy_onvif/shared.dart';
import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ptz_spaces.g.dart';

/// A list of supported coordinate systems including their range limitations.
@JsonSerializable()
class PtzSpaces {
  /// The Generic Pan/Tilt Position space is provided by every PTZ node that
  /// supports absolute Pan/Tilt, since it does not relate to a specific
  /// physical range. Instead, the range should be defined as the full range of
  /// the PTZ unit normalized to the range -1 to 1 resulting in the following
  /// space description.
  @JsonKey(name: 'AbsolutePanTiltPositionSpace', fromJson: _fromJson2D)
  final List<Space2D>? absolutePanTiltPositionSpace;

  /// The Generic Zoom Position Space is provided by every PTZ node that
  /// supports absolute Zoom, since it does not relate to a specific physical
  /// range. Instead, the range should be defined as the full range of the Zoom
  /// normalized to the range 0 (wide) to 1 (tele). There is no assumption about
  /// how the generic zoom range is mapped to magnification, FOV or other
  /// physical zoom dimension.
  @JsonKey(name: 'AbsoluteZoomPositionSpace', fromJson: _fromJson1D)
  final List<Space1D>? absoluteZoomPositionSpace;

  /// The Generic Pan/Tilt translation space is provided by every PTZ node that
  /// supports relative Pan/Tilt, since it does not relate to a specific
  /// physical range. Instead, the range should be defined as the full positive
  /// and negative translation range of the PTZ unit normalized to the range -1
  /// to 1, where positive translation would mean clockwise rotation or movement
  /// in right/up direction resulting in the following space description.
  @JsonKey(name: 'RelativePanTiltTranslationSpace', fromJson: _fromJson2D)
  final List<Space2D>? relativePanTiltTranslationSpace;

  /// The Generic Zoom Translation Space is provided by every PTZ node that
  /// supports relative Zoom, since it does not relate to a specific physical
  /// range. Instead, the corresponding absolute range should be defined as the
  /// full positive and negative translation range of the Zoom normalized to the
  /// range -1 to1, where a positive translation maps to a movement in TELE
  /// direction. The translation is signed to indicate direction (negative is to
  /// wide, positive is to tele). There is no assumption about how the generic
  /// zoom range is mapped to magnification, FOV or other physical zoom
  /// dimension. This results in the following space description.
  @JsonKey(name: 'RelativeZoomTranslationSpace', fromJson: _fromJson1D)
  final List<Space1D>? relativeZoomTranslationSpace;

  /// The generic Pan/Tilt velocity space shall be provided by every PTZ node,
  /// since it does not relate to a specific physical range. Instead, the range
  /// should be defined as a range of the PTZ unit’s speed normalized to the
  /// range -1 to 1, where a positive velocity would map to clockwise rotation
  /// or movement in the right/up direction. A signed speed can be independently
  /// specified for the pan and tilt component resulting in the following space
  /// description.
  @JsonKey(name: 'ContinuousPanTiltVelocitySpace', fromJson: _fromJson2D)
  final List<Space2D>? continuousPanTiltVelocitySpace;

  /// The generic zoom velocity space specifies a zoom factor velocity without
  /// knowing the underlying physical model. The range should be normalized
  /// from -1 to 1, where a positive velocity would map to TELE direction. A
  /// generic zoom velocity space description resembles the following.
  @JsonKey(name: 'ContinuousZoomVelocitySpace', fromJson: _fromJson1D)
  final List<Space1D>? continuousZoomVelocitySpace;

  /// The speed space specifies the speed for a Pan/Tilt movement when moving to
  /// an absolute position or to a relative translation. In contrast to the
  /// velocity spaces, speed spaces do not contain any directional information.
  /// The speed of a combined Pan/Tilt movement is represented by a single
  /// non-negative scalar value.
  @JsonKey(name: 'PanTiltSpeedSpace', fromJson: _fromJson1D)
  final List<Space1D>? panTiltSpeedSpace;

  /// The speed space specifies the speed for a Zoom movement when moving to an
  /// absolute position or to a relative translation. In contrast to the
  /// velocity spaces, speed spaces do not contain any directional information.
  @JsonKey(name: 'ZoomSpeedSpace', fromJson: _fromJson1D)
  final List<Space1D>? zoomSpeedSpace;

  @JsonKey(name: 'Extension')
  final Map<String, dynamic>? extension;

  PtzSpaces({
    this.absolutePanTiltPositionSpace,
    this.absoluteZoomPositionSpace,
    this.relativePanTiltTranslationSpace,
    this.relativeZoomTranslationSpace,
    this.continuousPanTiltVelocitySpace,
    this.continuousZoomVelocitySpace,
    this.panTiltSpeedSpace,
    this.zoomSpeedSpace,
    this.extension,
  });

  factory PtzSpaces.fromJson(Map<String, dynamic> json) =>
      _$PtzSpacesFromJson(json);

  Map<String, dynamic> toJson() => _$PtzSpacesToJson(this);

  @override
  String toString() => jsonEncode(toJson());

  static List<Space1D> _fromJson1D(dynamic json) => OnvifUtil.jsonList<Space1D>(
      json, (json) => Space1D.fromJson(json as Map<String, dynamic>));

  static List<Space2D> _fromJson2D(dynamic json) => OnvifUtil.jsonList<Space2D>(
      json, (json) => Space2D.fromJson(json as Map<String, dynamic>));
}
