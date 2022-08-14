import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'goto_preset_response.g.dart';

@JsonSerializable()
class GotoPresetResponse {
  GotoPresetResponse();

  factory GotoPresetResponse.fromJson(Map<String, dynamic> json) =>
      _$GotoPresetResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GotoPresetResponseToJson(this);

  @override
  String toString() => json.encode(toJson());
}
