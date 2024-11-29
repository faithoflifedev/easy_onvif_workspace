import 'dart:convert';

import 'package:easy_onvif/src/util/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'network_protocol.g.dart';

@JsonSerializable()
class NetworkProtocol {
  @JsonKey(name: 'Name', fromJson: OnvifUtil.stringMappedFromXml)
  final String name;

  @JsonKey(name: 'Enabled', fromJson: OnvifUtil.boolMappedFromXml)
  final bool enabled;

  @JsonKey(name: 'Port', fromJson: OnvifUtil.intMappedFromXml)
  final int port;

  NetworkProtocol(
      {required this.name, required this.enabled, required this.port});

  factory NetworkProtocol.fromJson(Map<String, dynamic> json) =>
      _$NetworkProtocolFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkProtocolToJson(this);

  @override
  String toString() => json.encode(toJson());
}
