import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'misc_capabilities.g.dart';

@JsonSerializable()
class MiscCapabilities {
  @JsonKey(name: 'AuxiliaryCommands')
  final List<dynamic> auxiliaryCommands;

  MiscCapabilities({required this.auxiliaryCommands});

  factory MiscCapabilities.fromJson(Map<String, dynamic> json) =>
      _$MiscCapabilitiesFromJson(json);

  Map<String, dynamic> toJson() => _$MiscCapabilitiesToJson(this);

  @override
  String toString() => json.encode(toJson());
}
