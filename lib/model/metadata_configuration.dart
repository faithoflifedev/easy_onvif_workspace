import 'dart:convert';

import 'package:easy_onvif/util/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'metadata_configuration.g.dart';

@JsonSerializable(explicitToJson: true)
class MetaDataConfiguration {
  @JsonKey(name: '@token')
  final String token;

  @JsonKey(name: 'Name', fromJson: OnvifUtil.mappedToString)
  final String name;

  @JsonKey(name: 'UseCount', fromJson: OnvifUtil.mappedToInt)
  final int useCount;

  MetaDataConfiguration(
      {required this.token, required this.name, required this.useCount});

  factory MetaDataConfiguration.fromJson(Map<String, dynamic> json) =>
      _$MetaDataConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$MetaDataConfigurationToJson(this);

  @override
  String toString() => json.encode(toJson());
}
