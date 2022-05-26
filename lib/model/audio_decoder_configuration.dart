import 'dart:convert';

import 'package:easy_onvif/util/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'audio_decoder_configuration.g.dart';

@JsonSerializable(explicitToJson: true)
class AudioDecoderConfiguration {
  @JsonKey(name: '@token')
  final String token;

  @JsonKey(name: 'Name', fromJson: OnvifUtil.mappedToString)
  final String name;

  @JsonKey(name: 'UseCount', fromJson: OnvifUtil.mappedToInt)
  final int useCount;

  AudioDecoderConfiguration(this.token, this.name, this.useCount);

  factory AudioDecoderConfiguration.fromJson(Map<String, dynamic> json) =>
      _$AudioDecoderConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$AudioDecoderConfigurationToJson(this);

  @override
  String toString() => json.encode(toJson());
}
