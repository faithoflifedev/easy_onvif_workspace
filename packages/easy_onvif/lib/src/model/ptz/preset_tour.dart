import 'dart:convert';

import 'package:easy_onvif/shared.dart';
import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'ptz_preset_tour_spot.dart';
import 'ptz_preset_tour_starting_condition.dart';
import 'ptz_preset_tour_status.dart';

part 'preset_tour.g.dart';

@JsonSerializable()
class PresetTour {
  /// Unique identifier of this preset tour.
  @JsonKey(name: '@token')
  final String token;

  /// Read only parameters to indicate the status of the preset tour.
  @JsonKey(name: 'Name')
  final String? name;

  /// Read only parameters to indicate the status of the preset tour.
  @JsonKey(name: 'Status')
  final PtzPresetTourStatus status;

  /// Auto Start flag of the preset tour. True allows the preset tour to be activated always.
  @JsonKey(name: 'AutoStart', fromJson: OnvifUtil.boolMappedFromXml)
  final bool autoStart;

  /// Parameters to specify the detail behavior of the preset tour.
  @JsonKey(name: 'StartingCondition')
  final PtzPresetTourStartingCondition startingCondition;

  /// A list of detail of touring spots including preset positions.
  @JsonKey(name: 'TourSpot')
  final PtzPresetTourSpot? tourSpot;

  @JsonKey(name: 'Extension')
  final dynamic extension;

  ReferenceToken get referenceToken => ReferenceToken(token);

  PresetTour({
    required this.token,
    this.name,
    required this.status,
    required this.autoStart,
    required this.startingCondition,
    this.tourSpot,
    this.extension,
  });

  factory PresetTour.fromJson(Map<String, dynamic> json) =>
      _$PresetTourFromJson(json);

  Map<String, dynamic> toJson() => _$PresetTourToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
