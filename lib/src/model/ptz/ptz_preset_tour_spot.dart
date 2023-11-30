import 'dart:convert';

import 'package:easy_onvif/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ptz_preset_tour_spot.g.dart';

/// Indicates a tour spot currently staying.
@JsonSerializable()
class PtzPresetTourSpot {
  /// Detail definition of preset position of the tour spot.
  @JsonKey(name: 'PresetDetail')
  final String presetDetail;

  /// Optional parameter to specify Pan/Tilt and Zoom speed on moving toward this tour spot.
  @JsonKey(name: 'Speed')
  final PtzSpeed? speed;

  /// Optional parameter to specify time duration of staying on this tour sport.
  @JsonKey(name: 'StayTime')
  final String? stayTime;

  @JsonKey(name: 'Extension')
  final dynamic extension;

  PtzPresetTourSpot({
    required this.presetDetail,
    this.speed,
    this.stayTime,
    this.extension,
  });

  factory PtzPresetTourSpot.fromJson(Map<String, dynamic> json) =>
      _$PtzPresetTourSpotFromJson(json);

  Map<String, dynamic> toJson() => _$PtzPresetTourSpotToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
