// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'videoEncoderConfiguration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoEncoderConfiguration _$VideoEncoderConfigurationFromJson(
    Map<String, dynamic> json) {
  return VideoEncoderConfiguration(
    xmlName: json['Name'],
    xmlUseCount: json['UseCount'],
    xmlEncoding: json['Encoding'],
    resolution: Resolution.fromJson(json['Resolution'] as Map<String, dynamic>),
    xmlQuality: json['Quality'],
    rateControl:
        RateControl.fromJson(json['RateControl'] as Map<String, dynamic>),
    mpeg4: json['MPEG4'] == null
        ? null
        : Mpeg4.fromJson(json['MPEG4'] as Map<String, dynamic>),
    h264: json['H264'] == null
        ? null
        : H264.fromJson(json['H264'] as Map<String, dynamic>),
    multiCast: Multicast.fromJson(json['Multicast'] as Map<String, dynamic>),
    xmlSessionTimeout: json['SessionTimeout'],
  );
}

Map<String, dynamic> _$VideoEncoderConfigurationToJson(
        VideoEncoderConfiguration instance) =>
    <String, dynamic>{
      'Name': instance.xmlName,
      'UseCount': instance.xmlUseCount,
      'Encoding': instance.xmlEncoding,
      'Resolution': instance.resolution.toJson(),
      'Quality': instance.xmlQuality,
      'RateControl': instance.rateControl.toJson(),
      'MPEG4': instance.mpeg4?.toJson(),
      'H264': instance.h264?.toJson(),
      'Multicast': instance.multiCast.toJson(),
      'SessionTimeout': instance.xmlSessionTimeout,
    };
