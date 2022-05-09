import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'preset.dart';

part 'get_preset_response.g.dart';

@JsonSerializable(explicitToJson: true)
class GetPresetResponse {
  @JsonKey(name: 'Preset')
  final List<Preset> presets;

  GetPresetResponse({required this.presets});

  factory GetPresetResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPresetResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetPresetResponseToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
