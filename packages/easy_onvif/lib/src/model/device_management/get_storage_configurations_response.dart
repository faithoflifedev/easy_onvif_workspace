import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'storage_configuration.dart';

part 'get_storage_configurations_response.g.dart';

/// This operation lists all existing storage configurations for the device.
@JsonSerializable()
class GetStorageConfigurationsResponse {
  @JsonKey(name: 'StorageConfigurations', fromJson: _fromJson)
  final List<StorageConfiguration> storageConfigurations;

  GetStorageConfigurationsResponse({required this.storageConfigurations});

  factory GetStorageConfigurationsResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$GetStorageConfigurationsResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetStorageConfigurationsResponseToJson(this);

  @override
  String toString() => json.encode(toJson());

  static List<StorageConfiguration> _fromJson(dynamic json) =>
      OnvifUtil.jsonList<StorageConfiguration>(
        json,
        (json) => StorageConfiguration.fromJson(json as Map<String, dynamic>),
      );
}
