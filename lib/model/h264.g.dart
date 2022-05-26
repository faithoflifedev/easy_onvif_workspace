// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'h264.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

H264 _$H264FromJson(Map<String, dynamic> json) => H264(
      govLength: json['govLength'] as int,
      h264Profile:
          OnvifUtil.mappedToString(json['H264Profile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$H264ToJson(H264 instance) => <String, dynamic>{
      'govLength': instance.govLength,
      'H264Profile': instance.h264Profile,
    };
