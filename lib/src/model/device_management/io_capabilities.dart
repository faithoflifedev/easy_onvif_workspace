import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'io_capabilities.g.dart';

@JsonSerializable()
class IoCapabilities {
  @JsonKey(name: '@AuxiliaryCommands', fromJson: _unbound)
  final List<dynamic> auxiliaryCommands;

  IoCapabilities({required this.auxiliaryCommands});

  factory IoCapabilities.fromJson(Map<String, dynamic> json) =>
      _$IoCapabilitiesFromJson(json);

  Map<String, dynamic> toJson() => _$IoCapabilitiesToJson(this);

  static List<dynamic> _unbound(dynamic json) {
    if (json is List) {
      return json.map((e) => json).toList();
    }

    return [json];
  }

  @override
  String toString() => json.encode(toJson());
}
