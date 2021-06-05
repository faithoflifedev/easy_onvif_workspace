import 'package:json_annotation/json_annotation.dart';

part 'audioSource.g.dart';

@JsonSerializable(explicitToJson: true)
class AudioSource {
  @JsonKey(name: '@token')
  final String token;

  @JsonKey(name: 'Channels')
  final dynamic mapChannels;

  int get channels => int.parse(mapChannels['\$']);

  AudioSource(this.token, this.mapChannels);

  factory AudioSource.fromJson(Map<String, dynamic> json) =>
      _$AudioSourceFromJson(json);

  Map<String, dynamic> toJson() => _$AudioSourceToJson(this);
}
