import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'version.g.dart';

@JsonSerializable()
class Version {
  @JsonKey(name: 'Major', fromJson: OnvifUtil.intMappedFromXml)
  final int major;

  @JsonKey(name: 'Minor', fromJson: OnvifUtil.intMappedFromXml)
  final int minor;

  Version({required this.major, required this.minor});

  factory Version.fromJson(Map<String, dynamic> json) =>
      _$VersionFromJson(json);

  Map<String, dynamic> toJson() => _$VersionToJson(this);

  @override
  String toString() => json.encode(toJson());
}
