import 'package:json_annotation/json_annotation.dart';

import 'configuration.dart';

part 'get_metadata_configurations_response.g.dart';

///This operation lists all existing metadata configurations. The client need
///not know anything apriori about the metadata in order to use the command.
@JsonSerializable(explicitToJson: true)
class GetMetadataConfigurationsResponse {
  ///This element contains a list of metadata configurations
  @JsonKey(name: 'Configurations', fromJson: _configurationConverter)
  final List<Configuration> configurations;

  GetMetadataConfigurationsResponse(this.configurations);

  factory GetMetadataConfigurationsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetMetadataConfigurationsResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetMetadataConfigurationsResponseToJson(this);

  static List<Configuration> _configurationConverter(dynamic json) {
    if (json is List) {
      return json
          .map((e) => Configuration.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    return [Configuration.fromJson(json as Map<String, dynamic>)];
  }
}
