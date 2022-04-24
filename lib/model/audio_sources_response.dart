import 'package:json_annotation/json_annotation.dart';

import 'audio_source.dart';

part 'audio_sources_response.g.dart';

///This command lists all available physical audio inputs of the device.
@JsonSerializable(explicitToJson: true)
class GetAudioSourcesResponse {
  @JsonKey(name: 'AudioSources')
  final AudioSource audioSource;

  GetAudioSourcesResponse({required this.audioSource});

  factory GetAudioSourcesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAudioSourcesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAudioSourcesResponseToJson(this);
}
