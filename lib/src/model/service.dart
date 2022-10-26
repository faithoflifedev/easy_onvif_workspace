import 'dart:convert';

import 'package:easy_onvif/onvif.dart';
import 'package:json_annotation/json_annotation.dart';

import 'version.dart';

part 'service.g.dart';

@JsonSerializable(explicitToJson: true)
class Service {
  @JsonKey(name: 'Namespace', fromJson: OnvifUtil.mappedToString)
  final String nameSpace;

  @JsonKey(name: 'XAddr', fromJson: OnvifUtil.mappedToString)
  final String xAddr;

  @JsonKey(name: 'Version')
  final Version version;

  @JsonKey(name: 'Capabilities')
  final Map<String, dynamic>? capabilites;

  Service(
      {required this.nameSpace,
      required this.xAddr,
      required this.version,
      this.capabilites});

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceToJson(this);

  @override
  String toString() => json.encode(toJson());
}
