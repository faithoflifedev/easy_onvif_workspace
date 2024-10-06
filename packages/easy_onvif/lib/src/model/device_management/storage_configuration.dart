import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'storage_configuration_data.dart';

part 'storage_configuration.g.dart';

@JsonSerializable()
class StorageConfiguration {
  @JsonKey(name: '@token')
  final String token;

  @JsonKey(name: 'Data')
  final StorageConfigurationData data;

  StorageConfiguration({
    required this.token,
    required this.data,
  });

  factory StorageConfiguration.fromJson(Map<String, dynamic> json) =>
      _$StorageConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$StorageConfigurationToJson(this);

  @override
  String toString() => json.encode(toJson());
}
