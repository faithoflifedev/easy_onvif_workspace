import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'capabilities.g.dart';

/// The capabilities for the replay service is returned in the Capabilities
///  element.
@JsonSerializable()
class Capabilities {
  /// Indicator that the Device supports reverse playback as defined in the
  /// ONVIF Streaming Specification.
  @JsonKey(name: '@ReversePlayback', fromJson: OnvifUtil.stringToBool)
  final bool reversePlayback;

  /// The list contains two elements defining the minimum and maximum valid
  /// values supported as session timeout in seconds.
  @JsonKey(
    name: '@SessionTimeoutRange',
    fromJson: OnvifUtil.stringMappedFromXml,
  )
  final String sessionTimeoutRange;

  /// Indicates support for RTP/RTSP/TCP.
  @JsonKey(name: '@RTP_RTSP_TCP', fromJson: OnvifUtil.stringToBool)
  final bool rtpRtspTcp;

  /// If playback streaming over WebSocket is supported, this shall return the
  /// RTSP WebSocket URI as described in Streaming Specification Section 5.1.1.5.
  @JsonKey(name: '@RTSPWebSocketUri', fromJson: OnvifUtil.stringMappedFromXml)
  final String rtspWebSocketUri;

  Capabilities({
    required this.reversePlayback,
    required this.sessionTimeoutRange,
    required this.rtpRtspTcp,
    required this.rtspWebSocketUri,
  });

  factory Capabilities.fromJson(Map<String, dynamic> json) =>
      _$CapabilitiesFromJson(json);

  Map<String, dynamic> toJson() => _$CapabilitiesToJson(this);

  @override
  String toString() => json.encode(toJson());
}
