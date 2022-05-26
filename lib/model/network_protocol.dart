import 'dart:convert';

import 'package:easy_onvif/util/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'network_protocol.g.dart';

@JsonSerializable(explicitToJson: true)
class NetworkProtocol {
  @JsonKey(name: 'Name', fromJson: OnvifUtil.mappedToString)
  final String name;

  @JsonKey(name: 'Enabled', fromJson: OnvifUtil.mappedToBool)
  final bool enabled;

  @JsonKey(name: 'Port', fromJson: OnvifUtil.mappedToInt)
  final int port;

  NetworkProtocol(
      {required this.name, required this.enabled, required this.port});

  factory NetworkProtocol.fromJson(Map<String, dynamic> json) =>
      _$NetworkProtocolFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkProtocolToJson(this);

  @override
  String toString() => json.encode(toJson());
}
