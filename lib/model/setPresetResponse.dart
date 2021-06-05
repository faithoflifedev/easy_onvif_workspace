import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'setPresetResponse.g.dart';

@JsonSerializable(explicitToJson: true)
class SetPresetResponse {
  @JsonKey(name: 'PresetToken')
  final String presetToken;

  SetPresetResponse({required this.presetToken});

  factory SetPresetResponse.fromJson(Map<String, dynamic> json) =>
      _$SetPresetResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SetPresetResponseToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
