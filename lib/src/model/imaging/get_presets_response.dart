import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'imaging_preset.dart';

part 'get_presets_response.g.dart';

/// Via this command the list of available Imaging Presets can be requested.
@JsonSerializable()
class GetPresetsResponse {
  /// List of Imaging Presets which are available for the requested VideoSource.
  @JsonKey(name: 'Preset', fromJson: _listIfEmpty)
  final List<ImagingPreset> presets;

  GetPresetsResponse({required this.presets});

  factory GetPresetsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPresetsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetPresetsResponseToJson(this);

  @override
  String toString() => jsonEncode(toJson());

  static List<ImagingPreset> _listIfEmpty(List<dynamic>? value) =>
      value
          ?.map((e) => ImagingPreset.fromJson(e as Map<String, dynamic>))
          .toList() ??
      <ImagingPreset>[];
}
