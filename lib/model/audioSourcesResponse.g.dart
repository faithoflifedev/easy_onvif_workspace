// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audioSourcesResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAudioSourcesResponse _$GetAudioSourcesResponseFromJson(
        Map<String, dynamic> json) =>
    GetAudioSourcesResponse(
      audioSource:
          AudioSource.fromJson(json['AudioSources'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetAudioSourcesResponseToJson(
        GetAudioSourcesResponse instance) =>
    <String, dynamic>{
      'AudioSources': instance.audioSource.toJson(),
    };
