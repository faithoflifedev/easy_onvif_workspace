import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'preset_tour.dart';

part 'get_preset_tours_response.g.dart';

/// Operation to request PTZ preset tours in the selected media profiles.
@JsonSerializable()
class GetPresetToursResponse {
  @JsonKey(name: 'PresetTour', fromJson: _unbound)
  final List<PresetTour> presetTours;

  GetPresetToursResponse({required this.presetTours});

  factory GetPresetToursResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPresetToursResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetPresetToursResponseToJson(this);

  @override
  String toString() => jsonEncode(toJson());

  static List<PresetTour> _unbound(dynamic json) {
    if (json == null) return <PresetTour>[];

    if (json is List) {
      return json
          .map((e) => PresetTour.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    return [PresetTour.fromJson(json as Map<String, dynamic>)];
  }
}
