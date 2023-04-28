import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'imaging_preset.dart';

part 'get_current_preset_response.g.dart';

/// Via this command the last Imaging Preset applied can be requested. If the
/// camera configuration does not match any of the existing Imaging Presets, the
/// output of GetCurrentPreset shall be Empty. GetCurrentPreset shall return 0
/// if Imaging Presets are not supported by the Video Source.
@JsonSerializable()
class GetCurrentPresetResponse {
  /// Current Imaging Preset in use for the specified Video Source.
  @JsonKey(name: 'Preset')
  final ImagingPreset preset;

  GetCurrentPresetResponse({required this.preset});

  factory GetCurrentPresetResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCurrentPresetResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetCurrentPresetResponseToJson(this);

  @override
  String toString() => json.encode(toJson());
}
