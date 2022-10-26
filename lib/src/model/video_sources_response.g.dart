// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_sources_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetVideoSourcesResponse _$GetVideoSourcesResponseFromJson(
        Map<String, dynamic> json) =>
    GetVideoSourcesResponse(
      GetVideoSourcesResponse._videoSourcesConvertor(json['VideoSources']),
    );

Map<String, dynamic> _$GetVideoSourcesResponseToJson(
        GetVideoSourcesResponse instance) =>
    <String, dynamic>{
      'VideoSources': instance.videoSources.map((e) => e.toJson()).toList(),
    };
