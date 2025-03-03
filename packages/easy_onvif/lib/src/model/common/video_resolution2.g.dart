// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_resolution2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoResolution2 _$VideoResolution2FromJson(Map<String, dynamic> json) =>
    VideoResolution2(
      width: OnvifUtil.intMappedFromXml(json['Width'] as Map<String, dynamic>),
      height: OnvifUtil.intMappedFromXml(
        json['Height'] as Map<String, dynamic>,
      ),
    );
