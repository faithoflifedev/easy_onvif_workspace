import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'preset_tour.dart';

part 'get_preset_tours_response.g.dart';

/// Operation to request PTZ preset tours in the selected media profiles.
@JsonSerializable()
class GetPresetToursResponse {
  @JsonKey(name: 'PresetTour', fromJson: _fromJson)
  final List<PresetTour> presetTours;

  GetPresetToursResponse({required this.presetTours});

  factory GetPresetToursResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPresetToursResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetPresetToursResponseToJson(this);

  @override
  String toString() => jsonEncode(toJson());

  static List<PresetTour> _fromJson(dynamic json) =>
      OnvifUtil.jsonList<PresetTour>(
          json, (json) => PresetTour.fromJson(json as Map<String, dynamic>));
}
