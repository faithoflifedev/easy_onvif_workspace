import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'metadata_configuration_options_extension.g.dart';

@JsonSerializable()
class MetadataConfigurationOptionsExtension {
  @JsonKey(name: 'CompressionType', fromJson: _unbound)
  final List<String>? compressionType;

  @JsonKey(name: 'Extension')
  final Map<String, dynamic>? extension;

  MetadataConfigurationOptionsExtension({
    this.compressionType,
    this.extension,
  });

  factory MetadataConfigurationOptionsExtension.fromJson(
          Map<String, dynamic> json) =>
      _$MetadataConfigurationOptionsExtensionFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MetadataConfigurationOptionsExtensionToJson(this);

  @override
  String toString() => json.encode(toJson());

  static List<String> _unbound(dynamic json) {
    if (json == null) {
      return [];
    } else if (json is String && json.contains(',')) {
      return json.split(',');
    } else if (json is String && !json.contains(',')) {
      return [json];
    }

    return [];
  }
}
