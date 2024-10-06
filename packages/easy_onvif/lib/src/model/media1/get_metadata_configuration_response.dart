import 'dart:convert';

import 'package:easy_onvif/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_metadata_configuration_response.g.dart';

/// The GetMetadataConfiguration command fetches the metadata configuration if
/// the metadata token is known.
@JsonSerializable()
class GetMetadataConfigurationResponse {
  /// The requested metadata configuration.
  @JsonKey(name: 'Configuration')
  final MetadataConfiguration configuration;

  GetMetadataConfigurationResponse({required this.configuration});

  factory GetMetadataConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetMetadataConfigurationResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetMetadataConfigurationResponseToJson(this);

  @override
  String toString() => json.encode(toJson());
}
