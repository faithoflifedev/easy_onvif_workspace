import 'dart:convert';

import 'package:easy_onvif/src/util/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hostname_information.g.dart';

@JsonSerializable()
class HostnameInformation {
  @JsonKey(name: 'FromDHCP', fromJson: OnvifUtil.mappedToString)
  final String fromDhcp;

  @JsonKey(name: 'Name', fromJson: OnvifUtil.mappedToString)
  final String name;

  HostnameInformation({required this.fromDhcp, required this.name});

  factory HostnameInformation.fromJson(Map<String, dynamic> json) =>
      _$HostnameInformationFromJson(json);

  Map<String, dynamic> toJson() => _$HostnameInformationToJson(this);

  @override
  String toString() => json.encode(toJson());
}
