import 'package:json_annotation/json_annotation.dart';

import 'audioSource.dart';

part 'audioSourcesResponse.g.dart';

@JsonSerializable(explicitToJson: true)
class GetAudioSourcesResponse {
  @JsonKey(name: 'AudioSources')
  final AudioSource audioSource;

  GetAudioSourcesResponse({required this.audioSource});

  factory GetAudioSourcesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAudioSourcesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAudioSourcesResponseToJson(this);
}
