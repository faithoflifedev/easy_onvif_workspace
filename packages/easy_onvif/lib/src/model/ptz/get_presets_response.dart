import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'preset.dart';

part 'get_presets_response.g.dart';

@JsonSerializable()
class GetPresetsResponse {
  @JsonKey(
    name: 'Preset',
    fromJson: _listIfEmpty,
  )
  final List<Preset> presets;

  GetPresetsResponse({required this.presets});

  factory GetPresetsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPresetsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetPresetsResponseToJson(this);

  @override
  String toString() => jsonEncode(toJson());

  static List<Preset> _listIfEmpty(List<dynamic>? value) =>
      value?.map((e) => Preset.fromJson(e as Map<String, dynamic>)).toList() ??
      <Preset>[];
}
