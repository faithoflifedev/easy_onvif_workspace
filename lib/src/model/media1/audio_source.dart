import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'audio_source.g.dart';

///List of existing Audio Sources
@JsonSerializable()
class AudioSource {
  ///Unique identifier referencing the physical entity.
  @JsonKey(name: '@token')
  final String token;

  @JsonKey(name: 'Channels', fromJson: OnvifUtil.mappedToInt)
  final int channels;

  AudioSource({required this.token, required this.channels});

  factory AudioSource.fromJson(Map<String, dynamic> json) =>
      _$AudioSourceFromJson(json);

  Map<String, dynamic> toJson() => _$AudioSourceToJson(this);

  @override
  String toString() => json.encode(toJson());
}
