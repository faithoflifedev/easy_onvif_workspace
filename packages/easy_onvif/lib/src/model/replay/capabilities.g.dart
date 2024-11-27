// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'capabilities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Capabilities _$CapabilitiesFromJson(Map<String, dynamic> json) => Capabilities(
      reversePlayback:
          OnvifUtil.stringToBool(json['@ReversePlayback'] as String),
      sessionTimeoutRange:
          OnvifUtil.mappedToString(json['@SessionTimeoutRange']),
      rtpRtspTcp: OnvifUtil.stringToBool(json['@RTP_RTSP_TCP'] as String),
      rtspWebSocketUri: OnvifUtil.mappedToString(json['@RTSPWebSocketUri']),
    );

Map<String, dynamic> _$CapabilitiesToJson(Capabilities instance) =>
    <String, dynamic>{
      '@ReversePlayback': instance.reversePlayback,
      '@SessionTimeoutRange': instance.sessionTimeoutRange,
      '@RTP_RTSP_TCP': instance.rtpRtspTcp,
      '@RTSPWebSocketUri': instance.rtspWebSocketUri,
    };
