// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'streaming_capabilities.g.dart';

/// Streaming capabilities.
@JsonSerializable()
class StreamingCapabilities {
  /// Indicates support for RTP multicast.
  @JsonKey(name: '@RTPMulticast', fromJson: OnvifUtil.stringToBool)
  final bool rtpMulticast;

  /// Indicates support for RTP over TCP.
  @JsonKey(name: '@RTP_TCP', fromJson: OnvifUtil.stringToBool)
  final bool rtp_tcp;

  /// Indicates support for RTP/RTSP/TCP.
  @JsonKey(name: '@RTP_RTSP_TCP', fromJson: OnvifUtil.stringToBool)
  final bool rtp_rtsp_tcp;

  /// Indicates support for non aggregate RTSP control.
  @JsonKey(
    name: '@NonAggregateControl',
    fromJson: OnvifUtil.nullableStringToBool,
  )
  final bool? nonAggregateControl;

  /// Indicates the device does not support live media streaming via RTSP.
  @JsonKey(name: '@NoRTSPStreaming', fromJson: OnvifUtil.nullableStringToBool)
  final bool? noRtspStreaming;

  StreamingCapabilities({
    required this.rtpMulticast,
    required this.rtp_tcp,
    required this.rtp_rtsp_tcp,
    required this.nonAggregateControl,
    required this.noRtspStreaming,
  });

  factory StreamingCapabilities.fromJson(Map<String, dynamic> json) =>
      _$StreamingCapabilitiesFromJson(json);

  Map<String, dynamic> toJson() => _$StreamingCapabilitiesToJson(this);

  @override
  String toString() => json.encode(toJson());
}
