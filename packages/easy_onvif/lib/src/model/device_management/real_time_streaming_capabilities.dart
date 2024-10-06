// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'media_capabilities_extension.dart';

part 'real_time_streaming_capabilities.g.dart';

/// Streaming capabilities.
@JsonSerializable()
class RealTimeStreamingCapabilities {
  /// Indicates support for RTP multicast.
  @JsonKey(
    name: 'RTPMulticast',
    fromJson: OnvifUtil.nullableMappedToBool,
  )
  final bool? rtpMulticast;

  /// Indicates support for RTP over TCP.
  @JsonKey(
    name: 'RTP_TCP',
    fromJson: OnvifUtil.nullableMappedToBool,
  )
  final bool? rtp_tcp;

  /// Indicates support for RTP/RTSP/TCP.
  @JsonKey(
    name: 'RTP_RTSP_TCP',
    fromJson: OnvifUtil.nullableMappedToBool,
  )
  final bool? rtp_rtsp_tcp;

  final MediaCapabilitiesExtension? extension;

  RealTimeStreamingCapabilities({
    this.rtpMulticast,
    this.rtp_tcp,
    this.rtp_rtsp_tcp,
    this.extension,
  });

  factory RealTimeStreamingCapabilities.fromJson(Map<String, dynamic> json) =>
      _$RealTimeStreamingCapabilitiesFromJson(json);

  Map<String, dynamic> toJson() => _$RealTimeStreamingCapabilitiesToJson(this);

  @override
  String toString() => json.encode(toJson());
}
