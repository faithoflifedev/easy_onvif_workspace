import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'audio_source_configuration.g.dart';

///Optional configuration of the Audio input.
@JsonSerializable(explicitToJson: true)
class AudioSourceConfiguration {
  @JsonKey(name: 'Name')
  final dynamic xmlName;

  @JsonKey(name: 'UseCount')
  final dynamic xmlUseCount;

  ///Token of the Audio Source the configuration applies to
  @JsonKey(name: 'SourceToken')
  final dynamic sourceToken;

  ///User readable name. Length up to 64 characters.
  String get name => xmlName['\$'];

  ///Number of internal references currently using this configuration.
  ///This informational parameter is read-only. Deprecated for Media2 Service.
  int get useCount => int.parse(xmlUseCount['\$']);

  AudioSourceConfiguration(this.xmlName, this.xmlUseCount, this.sourceToken);

  factory AudioSourceConfiguration.fromJson(Map<String, dynamic> json) =>
      _$AudioSourceConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$AudioSourceConfigurationToJson(this);

  @override
  String toString() => json.encode(toJson());
}
