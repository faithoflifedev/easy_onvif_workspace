// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_resolution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoResolution _$VideoResolutionFromJson(Map<String, dynamic> json) =>
    VideoResolution(
      width: OnvifUtil.mappedToInt(json['Width'] as Map<String, dynamic>),
      height: OnvifUtil.mappedToInt(json['Height'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VideoResolutionToJson(VideoResolution instance) =>
    <String, dynamic>{
      'Width': instance.width,
      'Height': instance.height,
    };
