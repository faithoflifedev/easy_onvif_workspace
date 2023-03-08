import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'transport.g.dart';

@JsonSerializable()
class Transport {
  /// Defines the network protocol for streaming, either UDP=RTP/UDP,
  /// RTSP=RTP/RTSP/TCP or HTTP=RTP/RTSP/HTTP/TCP
  /// - enum { 'UDP', 'TCP', 'RTSP', 'HTTP' }
  @JsonKey(name: 'Protocol')
  final String protocol;

  Transport({
    required this.protocol,
  });

  factory Transport.fromJson(Map<String, dynamic> json) =>
      _$TransportFromJson(json);

  Map<String, dynamic> toJson() => _$TransportToJson(this);

  @override
  String toString() => json.encode(toJson());
}
