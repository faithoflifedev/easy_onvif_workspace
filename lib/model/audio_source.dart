import 'package:json_annotation/json_annotation.dart';

part 'audio_source.g.dart';

///List of existing Audio Sources
@JsonSerializable(explicitToJson: true)
class AudioSource {
  ///Unique identifier referencing the physical entity.
  @JsonKey(name: '@token')
  final String token;

  @JsonKey(name: 'Channels')
  final dynamic mapChannels;

  ///number of available audio channels. (1: mono, 2: stereo)
  int get channels => int.parse(mapChannels['\$']);

  AudioSource(this.token, this.mapChannels);

  factory AudioSource.fromJson(Map<String, dynamic> json) =>
      _$AudioSourceFromJson(json);

  Map<String, dynamic> toJson() => _$AudioSourceToJson(this);
}
