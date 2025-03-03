// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_encoder_configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AudioEncoderConfiguration _$AudioEncoderConfigurationFromJson(
  Map<String, dynamic> json,
) => AudioEncoderConfiguration(
  OnvifUtil.stringMappedFromXml(json['Name'] as Map<String, dynamic>),
  OnvifUtil.intMappedFromXml(json['UseCount'] as Map<String, dynamic>),
  AudioEncoderConfiguration.mappedToAudioCodecEncoding(
    json['Encoding'] as Map<String, dynamic>,
  ),
  OnvifUtil.intMappedFromXml(json['Bitrate'] as Map<String, dynamic>),
  OnvifUtil.intMappedFromXml(json['SampleRate'] as Map<String, dynamic>),
  OnvifUtil.emptyOrMulticastConfiguration(
    json['Multicast'] as Map<String, dynamic>?,
  ),
  OnvifUtil.stringMappedFromXml(json['SessionTimeout'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AudioEncoderConfigurationToJson(
  AudioEncoderConfiguration instance,
) => <String, dynamic>{
  'Name': instance.name,
  'UseCount': instance.useCount,
  'Encoding': _$AudioCodecEncodingEnumMap[instance.audioCodecEncoding]!,
  'Bitrate': instance.bitRate,
  'SampleRate': instance.sampleRate,
  'Multicast': instance.multiCast,
  'SessionTimeout': instance.sessionTimeout,
};

const _$AudioCodecEncodingEnumMap = {
  AudioCodecEncoding.g711: 'g711',
  AudioCodecEncoding.g726: 'g726',
  AudioCodecEncoding.aac: 'aac',
};
