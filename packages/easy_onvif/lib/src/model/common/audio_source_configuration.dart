import 'dart:convert';

import 'package:easy_onvif/src/util/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'audio_source_configuration.g.dart';

///Optional configuration of the Audio input.
@JsonSerializable()
class AudioSourceConfiguration {
  ///User readable name. Length up to 64 characters.
  @JsonKey(name: 'Name', fromJson: OnvifUtil.mappedToString)
  final String name;

  ///Number of internal references currently using this configuration.
  ///This informational parameter is read-only. Deprecated for Media2 Service.
  @JsonKey(name: 'UseCount', fromJson: OnvifUtil.mappedToInt)
  final int useCount;

  ///Token of the Audio Source the configuration applies to
  @JsonKey(name: 'SourceToken', fromJson: OnvifUtil.mappedToString)
  final String sourceToken;

  AudioSourceConfiguration(
      {required this.name, required this.useCount, required this.sourceToken});

  factory AudioSourceConfiguration.fromJson(Map<String, dynamic> json) =>
      _$AudioSourceConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$AudioSourceConfigurationToJson(this);

  @override
  String toString() => json.encode(toJson());
}
