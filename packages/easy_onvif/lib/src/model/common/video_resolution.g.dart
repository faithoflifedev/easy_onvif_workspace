// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_resolution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoResolution _$VideoResolutionFromJson(Map<String, dynamic> json) =>
    VideoResolution(
      width: OnvifUtil.intMappedFromXml(json['Width'] as Map<String, dynamic>),
      height: OnvifUtil.intMappedFromXml(
        json['Height'] as Map<String, dynamic>,
      ),
    );
