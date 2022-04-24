// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_sources_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetVideoSourcesResponse _$GetVideoSourcesResponseFromJson(
        Map<String, dynamic> json) =>
    GetVideoSourcesResponse(
      VideoSources.fromJson(json['VideoSources'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetVideoSourcesResponseToJson(
        GetVideoSourcesResponse instance) =>
    <String, dynamic>{
      'VideoSources': instance.videoSources.toJson(),
    };
