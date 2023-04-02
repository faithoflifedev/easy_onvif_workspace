import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'storage_configuration.dart';

part 'get_storage_configuration_response.g.dart';

/// This operation retrieves the Storage configuration associated with the given
/// storage configuration token.
@JsonSerializable()
class GetStorageConfigurationResponse {
  @JsonKey(name: 'StorageConfiguration')
  final StorageConfiguration storageConfiguration;

  GetStorageConfigurationResponse({required this.storageConfiguration});

  factory GetStorageConfigurationResponse.fromJson(Map<String, dynamic> json) =>
      _$GetStorageConfigurationResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetStorageConfigurationResponseToJson(this);

  @override
  String toString() => json.encode(toJson());
}
