// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:easy_onvif/util/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'multicast.dart';

part 'audio_encoder_configuration.g.dart';

// enum EncodingType {
//   @JsonValue('G711')
//   G711,
//   @JsonValue('G726')
//   G726,
//   @JsonValue('AAC')
//   AAC
// }

///The requested audio encoder configuration
@JsonSerializable(explicitToJson: true)
class AudioEncoderConfiguration {
  ///User readable name. Length up to 64 characters.
  @JsonKey(name: 'Name', fromJson: OnvifUtil.mappedToString)
  final String name;

  ///Number of internal references currently using this configuration.
  ///This informational parameter is read-only. Deprecated for Media2 Service.
  @JsonKey(name: 'UseCount', fromJson: OnvifUtil.mappedToInt)
  final int useCount;

  ///Audio codec used for encoding the audio input (either G.711, G.726 or AAC)
  ///- enum { 'G711', 'G726', 'AAC' }
  @JsonKey(name: 'Encoding', fromJson: OnvifUtil.mappedToString)
  final String encodingType;

  ///The output bitrate in kbps.
  @JsonKey(name: 'Bitrate', fromJson: OnvifUtil.mappedToInt)
  final int bitRate;

  ///The output sample rate in kHz.
  @JsonKey(name: 'SampleRate', fromJson: OnvifUtil.mappedToInt)
  final int sampleRate;

  @JsonKey(name: 'Multicast')
  final Multicast multiCast;

  ///The rtsp session timeout for the related audio stream
  @JsonKey(name: 'SessionTimeout', fromJson: OnvifUtil.mappedToString)
  final String sessionTimeout;

  AudioEncoderConfiguration(this.name, this.useCount, this.encodingType,
      this.bitRate, this.sampleRate, this.multiCast, this.sessionTimeout);

  factory AudioEncoderConfiguration.fromJson(Map<String, dynamic> json) =>
      _$AudioEncoderConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$AudioEncoderConfigurationToJson(this);

  @override
  String toString() => json.encode(toJson());
}
