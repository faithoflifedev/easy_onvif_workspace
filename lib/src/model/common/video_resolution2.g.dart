// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_resolution2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoResolution2 _$VideoResolution2FromJson(Map<String, dynamic> json) =>
    VideoResolution2(
      width: OnvifUtil.mappedToInt(json['Width'] as Map<String, dynamic>),
      height: OnvifUtil.mappedToInt(json['Height'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VideoResolution2ToJson(VideoResolution2 instance) =>
    <String, dynamic>{
      'Width': instance.width,
      'Height': instance.height,
    };
