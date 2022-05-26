import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'misc_capabilities.g.dart';

@JsonSerializable()
class MiscCapabilities {
  @JsonKey(name: '@AuxiliaryCommands', fromJson: _auxiliaryCommandsConverter)
  final List<dynamic> auxiliaryCommands;

  MiscCapabilities({required this.auxiliaryCommands});

  factory MiscCapabilities.fromJson(Map<String, dynamic> json) =>
      _$MiscCapabilitiesFromJson(json);

  Map<String, dynamic> toJson() => _$MiscCapabilitiesToJson(this);

  static List<dynamic> _auxiliaryCommandsConverter(dynamic json) {
    if (json is List) {
      return json.map((e) => json).toList();
    }

    return [json];
  }

  @override
  String toString() => json.encode(toJson());
}
