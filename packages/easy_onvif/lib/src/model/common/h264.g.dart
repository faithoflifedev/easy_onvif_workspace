// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'h264.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

H264 _$H264FromJson(Map<String, dynamic> json) => H264(
      govLength:
          OnvifUtil.mappedToInt(json['GovLength'] as Map<String, dynamic>),
      h264Profile: OnvifUtil.mappedToString(json['H264Profile']),
    );

Map<String, dynamic> _$H264ToJson(H264 instance) => <String, dynamic>{
      'GovLength': instance.govLength,
      'H264Profile': instance.h264Profile,
    };
