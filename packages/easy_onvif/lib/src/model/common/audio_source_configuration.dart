import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'audio_source_configuration.g.dart';

/// Optional configuration of the Audio input.
@JsonSerializable()
class AudioSourceConfiguration {
  static final _xmlMappedFields = <String>['Name', 'UseCount', 'SourceToken'];

  /// User readable name. Length up to 64 characters.
  @JsonKey(name: 'Name', fromJson: OnvifUtil.stringMappedFromXml)
  final String name;

  /// Number of internal references currently using this configuration.
  /// This informational parameter is read-only. Deprecated for Media2 Service.
  @JsonKey(name: 'UseCount', fromJson: OnvifUtil.intMappedFromXml)
  final int useCount;

  /// Token of the Audio Source the configuration applies to
  @JsonKey(name: 'SourceToken', fromJson: OnvifUtil.stringMappedFromXml)
  final String sourceToken;

  AudioSourceConfiguration({
    required this.name,
    required this.useCount,
    required this.sourceToken,
  });

  factory AudioSourceConfiguration.fromJson(Map<String, dynamic> json) =>
      _$AudioSourceConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$AudioSourceConfigurationToJson(
    this,
  ).convertFieldsToXmlMap(_xmlMappedFields);

  @override
  String toString() => json.encode(toJson());
}
