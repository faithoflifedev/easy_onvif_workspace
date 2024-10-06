import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'ptz_preset_tour_spot.dart';

part 'ptz_preset_tour_status.g.dart';

/// Indicates state of this preset tour by Idle/Touring/Paused.
/// - enum { 'Idle', 'Touring', 'Paused', 'Extended' }
enum PtzPresetTourState {
  @JsonValue('Idle')
  idle,
  @JsonValue('Touring')
  touring,
  @JsonValue('Paused')
  paused,
  @JsonValue('Extended')
  extended,
}

/// Read only parameters to indicate the status of the preset tour.
@JsonSerializable()
class PtzPresetTourStatus {
  /// Indicates state of this preset tour by Idle/Touring/Paused.
  /// - enum { 'Idle', 'Touring', 'Paused', 'Extended' }
  @JsonKey(name: 'State', fromJson: _fix)
  final PtzPresetTourState state;

  /// Indicates a tour spot currently staying.
  @JsonKey(name: 'CurrentTourSpot')
  final PtzPresetTourSpot? currentTourSpot;

  @JsonKey(name: 'Extension')
  final dynamic extension;

  PtzPresetTourStatus({
    required this.state,
    this.currentTourSpot,
    this.extension,
  });

  factory PtzPresetTourStatus.fromJson(Map<String, dynamic> json) =>
      _$PtzPresetTourStatusFromJson(json);

  Map<String, dynamic> toJson() => _$PtzPresetTourStatusToJson(this);

  static PtzPresetTourState _fix(Map<String, dynamic> value) =>
      $enumDecode(_$PtzPresetTourStateEnumMap, OnvifUtil.mappedToString(value));

  @override
  String toString() => jsonEncode(toJson());
}
