import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'preset_tour.dart';

part 'get_preset_tour_response.g.dart';

@JsonSerializable()
class GetPresetTourResponse {
  @JsonKey(name: 'PresetTour')
  final PresetTour presetTour;

  GetPresetTourResponse({required this.presetTour});

  factory GetPresetTourResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPresetTourResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetPresetTourResponseToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
