import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'system_log_uri.g.dart';

@JsonSerializable()
class SystemLogUri {
  @JsonKey(name: 'Type', fromJson: OnvifUtil.stringMappedFromXml)
  final String type;

  @JsonKey(name: 'Uri', fromJson: OnvifUtil.nullableStringMappedFromXml)
  final String? uri;

  SystemLogUri({required this.type, this.uri});

  factory SystemLogUri.fromJson(Map<String, dynamic> json) =>
      _$SystemLogUriFromJson(json);

  Map<String, dynamic> toJson() => _$SystemLogUriToJson(this);

  @override
  String toString() => json.encode(toJson());
}
