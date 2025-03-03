// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'streaming_capabilities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StreamingCapabilities _$StreamingCapabilitiesFromJson(
  Map<String, dynamic> json,
) => StreamingCapabilities(
  rtpMulticast: OnvifUtil.stringToBool(json['@RTPMulticast'] as String),
  rtp_tcp: OnvifUtil.stringToBool(json['@RTP_TCP'] as String),
  rtp_rtsp_tcp: OnvifUtil.stringToBool(json['@RTP_RTSP_TCP'] as String),
  nonAggregateControl: OnvifUtil.nullableStringToBool(
    json['@NonAggregateControl'] as String?,
  ),
  noRtspStreaming: OnvifUtil.nullableStringToBool(
    json['@NoRTSPStreaming'] as String?,
  ),
);

Map<String, dynamic> _$StreamingCapabilitiesToJson(
  StreamingCapabilities instance,
) => <String, dynamic>{
  '@RTPMulticast': instance.rtpMulticast,
  '@RTP_TCP': instance.rtp_tcp,
  '@RTP_RTSP_TCP': instance.rtp_rtsp_tcp,
  '@NonAggregateControl': instance.nonAggregateControl,
  '@NoRTSPStreaming': instance.noRtspStreaming,
};
