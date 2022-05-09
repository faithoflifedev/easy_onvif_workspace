// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate_control.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RateControl _$RateControlFromJson(Map<String, dynamic> json) => RateControl(
      json['FrameRateLimit'],
      json['EncodingInterval'],
      json['BitrateLimit'],
    );

Map<String, dynamic> _$RateControlToJson(RateControl instance) =>
    <String, dynamic>{
      'FrameRateLimit': instance.xmlFrameRateLimit,
      'EncodingInterval': instance.xmlEncodingInterval,
      'BitrateLimit': instance.xmlBitrateLimit,
    };
