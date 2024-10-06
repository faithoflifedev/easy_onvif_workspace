import 'dart:convert';

import 'package:easy_onvif/shared.dart';
import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_metadata_configurations_response.g.dart';

/// This operation lists all existing metadata configurations. The client need
/// not know anything apriori about the metadata in order to use the command.
@JsonSerializable()
class GetMetadataConfigurationsResponse {
  ///This element contains a list of metadata configurations
  @JsonKey(name: 'Configurations', fromJson: _fromJson)
  final List<MetadataConfiguration> configurations;

  GetMetadataConfigurationsResponse(this.configurations);

  factory GetMetadataConfigurationsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetMetadataConfigurationsResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetMetadataConfigurationsResponseToJson(this);

  static List<MetadataConfiguration> _fromJson(dynamic json) =>
      OnvifUtil.jsonList<MetadataConfiguration>(
          json,
          (json) =>
              MetadataConfiguration.fromJson(json as Map<String, dynamic>));

  @override
  String toString() => json.encode(toJson());
}
