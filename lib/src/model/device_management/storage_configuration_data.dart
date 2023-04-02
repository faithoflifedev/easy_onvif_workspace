import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'user.dart';

part 'storage_configuration_data.g.dart';

/// Unique identifier referencing the physical entity.
@JsonSerializable()
class StorageConfigurationData {
  /// StorageType lists the acceptable values for type attribute
  @JsonKey(name: '@type')
  final String type;

  /// local path
  @JsonKey(name: 'LocalPath', fromJson: OnvifUtil.nullableMappedToString)
  final String? localPath;

  /// Storage server address
  @JsonKey(name: 'StorageUri', fromJson: OnvifUtil.nullableMappedToString)
  final String? storageUri;

  /// User credential for the storage server
  @JsonKey(name: 'User')
  final User? user;

  @JsonKey(name: 'Extension')
  final Map<String, dynamic>? extension;

  StorageConfigurationData({
    required this.type,
    this.localPath,
    this.storageUri,
    this.user,
    this.extension,
  });

  factory StorageConfigurationData.fromJson(Map<String, dynamic> json) =>
      _$StorageConfigurationDataFromJson(json);

  Map<String, dynamic> toJson() => _$StorageConfigurationDataToJson(this);

  @override
  String toString() => json.encode(toJson());
}
