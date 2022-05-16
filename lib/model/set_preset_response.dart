import 'dart:convert';

import 'package:easy_onvif/onvif.dart';
import 'package:json_annotation/json_annotation.dart';

part 'set_preset_response.g.dart';

@JsonSerializable(explicitToJson: true)
class SetPresetResponse {
  @JsonKey(name: 'PresetToken', fromJson: OnvifUtil.mappedToString)
  final String presetToken;

  SetPresetResponse({required this.presetToken});

  factory SetPresetResponse.fromJson(Map<String, dynamic> json) =>
      _$SetPresetResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SetPresetResponseToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
