// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'streaming_capabilities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StreamingCapabilities _$StreamingCapabilitiesFromJson(
        Map<String, dynamic> json) =>
    StreamingCapabilities(
      rtpStreaming:
          OnvifUtil.nullableStringToBool(json['@RTPStreaming'] as String?),
      rtpMulticast:
          OnvifUtil.nullableStringToBool(json['@RTPMulticast'] as String?),
      rtpRtspTcp:
          OnvifUtil.nullableStringToBool(json['@RTP_RTSP_TCP'] as String?),
      nonAggregateControl: OnvifUtil.nullableStringToBool(
          json['@NonAggregateControl'] as String?),
      noRtspStreaming:
          OnvifUtil.nullableStringToBool(json['@NoRTSPStreaming'] as String?),
      rtspWebSocketUri: json['@RTSPWebSocketUri'] as String?,
      autoStartMulticast: OnvifUtil.nullableStringToBool(
          json['@AutoStartMulticast'] as String?),
      secureRTSPStreaming: OnvifUtil.nullableStringToBool(
          json['@SecureRTSPStreaming'] as String?),
    );

Map<String, dynamic> _$StreamingCapabilitiesToJson(
        StreamingCapabilities instance) =>
    <String, dynamic>{
      '@RTPStreaming': instance.rtpStreaming,
      '@RTPMulticast': instance.rtpMulticast,
      '@RTP_RTSP_TCP': instance.rtpRtspTcp,
      '@NonAggregateControl': instance.nonAggregateControl,
      '@NoRTSPStreaming': instance.noRtspStreaming,
      '@RTSPWebSocketUri': instance.rtspWebSocketUri,
      '@AutoStartMulticast': instance.autoStartMulticast,
      '@SecureRTSPStreaming': instance.secureRTSPStreaming,
    };
