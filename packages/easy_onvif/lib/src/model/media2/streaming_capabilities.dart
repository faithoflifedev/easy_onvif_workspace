import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'streaming_capabilities.g.dart';

/// Streaming capabilities.
@JsonSerializable()
class StreamingCapabilities {
  /// Indicates support for live media streaming via RTSP.
  @JsonKey(name: '@RTPStreaming', fromJson: OnvifUtil.nullableStringToBool)
  final bool? rtpStreaming;

  /// Indicates support for RTP multicast.
  @JsonKey(name: '@RTPMulticast', fromJson: OnvifUtil.nullableStringToBool)
  final bool? rtpMulticast;

  /// Indicates support for RTP/RTSP/TCP.
  @JsonKey(name: '@RTP_RTSP_TCP', fromJson: OnvifUtil.nullableStringToBool)
  final bool? rtpRtspTcp;

  /// Indicates support for non aggregate RTSP control.
  @JsonKey(
    name: '@NonAggregateControl',
    fromJson: OnvifUtil.nullableStringToBool,
  )
  final bool? nonAggregateControl;

  @JsonKey(name: '@NoRTSPStreaming', fromJson: OnvifUtil.nullableStringToBool)
  final bool? noRtspStreaming;

  /// If streaming over WebSocket is supported, this shall return the RTSP
  /// WebSocket URI as described in Streaming Specification Section 5.1.1.5.
  @JsonKey(name: '@RTSPWebSocketUri')
  final String? rtspWebSocketUri;

  /// Indicates support for non-RTSP controlled multicast streaming.
  @JsonKey(
    name: '@AutoStartMulticast',
    fromJson: OnvifUtil.nullableStringToBool,
  )
  final bool? autoStartMulticast;

  /// Indicates support for live media streaming via RTSPS and SRTP.
  @JsonKey(
    name: '@SecureRTSPStreaming',
    fromJson: OnvifUtil.nullableStringToBool,
  )
  final bool? secureRTSPStreaming;

  StreamingCapabilities({
    required this.rtpStreaming,
    required this.rtpMulticast,
    required this.rtpRtspTcp,
    required this.nonAggregateControl,
    this.noRtspStreaming,
    this.rtspWebSocketUri,
    this.autoStartMulticast,
    this.secureRTSPStreaming,
  });

  factory StreamingCapabilities.fromJson(Map<String, dynamic> json) =>
      _$StreamingCapabilitiesFromJson(json);

  Map<String, dynamic> toJson() => _$StreamingCapabilitiesToJson(this);

  @override
  String toString() => json.encode(toJson());
}
