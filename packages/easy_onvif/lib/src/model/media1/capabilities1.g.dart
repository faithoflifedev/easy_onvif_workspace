// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'capabilities1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Capabilities1 _$Capabilities1FromJson(Map<String, dynamic> json) =>
    Capabilities1(
      snapshotUri: OnvifUtil.stringToBool(json['@SnapshotUri'] as String),
      rotation: OnvifUtil.stringToBool(json['@Rotation'] as String),
      videoSourceMode: OnvifUtil.stringToBool(
        json['@VideoSourceMode'] as String,
      ),
      osd: OnvifUtil.stringToBool(json['@OSD'] as String),
      temporaryOSDText: OnvifUtil.nullableStringToBool(
        json['@TemporaryOSDText'] as String?,
      ),
      exiCompression: OnvifUtil.nullableStringToBool(
        json['@EXICompression'] as String?,
      ),
      profileCapabilities: ProfileCapabilities.fromJson(
        json['ProfileCapabilities'] as Map<String, dynamic>,
      ),
      streamingCapabilities: StreamingCapabilities.fromJson(
        json['StreamingCapabilities'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$Capabilities1ToJson(Capabilities1 instance) =>
    <String, dynamic>{
      '@SnapshotUri': instance.snapshotUri,
      '@Rotation': instance.rotation,
      '@VideoSourceMode': instance.videoSourceMode,
      '@OSD': instance.osd,
      '@TemporaryOSDText': instance.temporaryOSDText,
      '@EXICompression': instance.exiCompression,
      'ProfileCapabilities': instance.profileCapabilities,
      'StreamingCapabilities': instance.streamingCapabilities,
    };
