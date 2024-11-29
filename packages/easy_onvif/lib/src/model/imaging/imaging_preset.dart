import 'dart:convert';

import 'package:easy_onvif/src/util/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'imaging_preset.g.dart';

/// List of Imaging Presets which are available for the requested VideoSource.
@JsonSerializable()
class ImagingPreset {
  /// Unique identifier of this Imaging Preset.
  @JsonKey(name: '@token')
  final String token;

  /// Indicates Imaging Preset Type. Use timg:ImagingPresetType. Used for
  /// multi-language support and display.
  @JsonKey(name: 'type', fromJson: OnvifUtil.stringMappedFromXml)
  final String type;

  /// Human readable name of the Imaging Preset.
  @JsonKey(name: 'name', fromJson: OnvifUtil.stringMappedFromXml)
  final String name;

  ImagingPreset({
    required this.token,
    required this.type,
    required this.name,
  });

  factory ImagingPreset.fromJson(Map<String, dynamic> json) =>
      _$ImagingPresetFromJson(json);

  // factory ImagingPreset.fromToken(String token) =>
  //     ImagingPreset(token: token, type: '', name: '');

  Map<String, dynamic> toJson() => _$ImagingPresetToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
