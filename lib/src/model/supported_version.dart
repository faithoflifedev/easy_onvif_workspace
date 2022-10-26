import 'dart:convert';

import 'package:easy_onvif/onvif.dart';
import 'package:json_annotation/json_annotation.dart';

part 'supported_version.g.dart';

@JsonSerializable(explicitToJson: true)
class SupportedVersion {
  @JsonKey(name: 'Major', fromJson: OnvifUtil.mappedToString)
  final String major;

  @JsonKey(name: 'Minor', fromJson: OnvifUtil.mappedToString)
  final String minor;

  SupportedVersion(this.major, this.minor);

  factory SupportedVersion.fromJson(Map<String, dynamic> json) =>
      _$SupportedVersionFromJson(json);

  Map<String, dynamic> toJson() => _$SupportedVersionToJson(this);

  @override
  String toString() => json.encode(toJson());
}
