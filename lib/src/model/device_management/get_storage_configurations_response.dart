import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'storage_configuration.dart';

part 'get_storage_configurations_response.g.dart';

/// This operation lists all existing storage configurations for the device.
@JsonSerializable()
class GetStorageConfigurationsResponse {
  @JsonKey(
      name: 'StorageConfigurations', fromJson: _unboundStorageConfiguration)
  final List<StorageConfiguration> storageConfigurations;

  GetStorageConfigurationsResponse({required this.storageConfigurations});

  factory GetStorageConfigurationsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetStorageConfigurationsResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetStorageConfigurationsResponseToJson(this);

  @override
  String toString() => json.encode(toJson());

  static List<StorageConfiguration> _unboundStorageConfiguration(dynamic json) {
    if (json == null) return <StorageConfiguration>[];

    if (json is List) {
      return json
          .map((e) => StorageConfiguration.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    return [StorageConfiguration.fromJson(json as Map<String, dynamic>)];
  }
}
