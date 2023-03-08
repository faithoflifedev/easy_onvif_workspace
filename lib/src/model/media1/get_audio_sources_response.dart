import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'audio_source.dart';

part 'get_audio_sources_response.g.dart';

///This command lists all available physical audio inputs of the device.
@JsonSerializable()
class GetAudioSourcesResponse {
  @JsonKey(name: 'AudioSources', fromJson: _audioSourcesConvertor)
  final List<AudioSource> audioSources;

  GetAudioSourcesResponse({required this.audioSources});

  factory GetAudioSourcesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAudioSourcesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAudioSourcesResponseToJson(this);

  static List<AudioSource> _audioSourcesConvertor(dynamic json) {
    if (json == null) {
      return [];
    }

    if (json is List) {
      return json
          .map((e) => AudioSource.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    return [AudioSource.fromJson(json as Map<String, dynamic>)];
  }

  @override
  String toString() => json.encode(toJson());
}
