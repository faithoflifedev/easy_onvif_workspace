// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_audio_sources_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAudioSourcesResponse _$GetAudioSourcesResponseFromJson(
  Map<String, dynamic> json,
) => GetAudioSourcesResponse(
  audioSources: GetAudioSourcesResponse._audioSourcesConvertor(
    json['AudioSources'],
  ),
);

Map<String, dynamic> _$GetAudioSourcesResponseToJson(
  GetAudioSourcesResponse instance,
) => <String, dynamic>{'AudioSources': instance.audioSources};
