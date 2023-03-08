import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'metadata_configuration_options.dart';

part 'get_metadata_configuration_options_response.g.dart';

/// This operation returns the available options (supported values and ranges
/// for metadata configuration parameters) for changing the metadata
/// configuration.
@JsonSerializable()
class GetMetadataConfigurationOptionsResponse {
  /// This message contains the metadata configuration options. If a metadata
  /// configuration is specified, the options shall concern that particular
  /// configuration. If a media profile is specified, the options shall be
  /// compatible with that media profile. If no tokens are specified, the options
  /// shall be considered generic for the device.
  @JsonKey(name: 'Options')
  final MetadataConfigurationOptions options;

  GetMetadataConfigurationOptionsResponse({required this.options});

  factory GetMetadataConfigurationOptionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetMetadataConfigurationOptionsResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetMetadataConfigurationOptionsResponseToJson(this);

  @override
  String toString() => json.encode(toJson());
}
