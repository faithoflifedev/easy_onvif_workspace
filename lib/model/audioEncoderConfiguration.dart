import 'package:json_annotation/json_annotation.dart';

import 'multicast.dart';

part 'audioEncoderConfiguration.g.dart';

@JsonSerializable(explicitToJson: true)

///The requested audio encoder configuration
class AudioEncoderConfiguration {
  @JsonKey(name: 'Name')
  final dynamic xmlName;

  @JsonKey(name: 'UseCount')
  final dynamic xmlUseCount;

  @JsonKey(name: 'Encoding')
  final dynamic xmlEncoding;

  @JsonKey(name: 'Bitrate')
  final dynamic xmlBitRate;

  @JsonKey(name: 'SampleRate')
  final dynamic xmlSampleRate;

  @JsonKey(name: 'Multicast')
  final Multicast multiCast;

  @JsonKey(name: 'SessionTimeout')
  final dynamic xmlSessionTimeout;

  ///User readable name. Length up to 64 characters.
  String get name => xmlName['\$'];

  ///Audio codec used for encoding the audio input (either G.711, G.726 or AAC)
  ///- enum { 'G711', 'G726', 'AAC' }
  String get encoding => xmlEncoding['\$'];

  ///Number of internal references currently using this configuration.
  ///This informational parameter is read-only. Deprecated for Media2 Service.
  int get useCount => int.parse(xmlUseCount['\$']);

  ///The output bitrate in kbps.
  int get bitRate => int.parse(xmlBitRate['\$']);

  ///The output sample rate in kHz.
  int get sampleRate => int.parse(xmlSampleRate['\$']);

  ///The rtsp session timeout for the related audio stream
  String get sessionTimeout => xmlSessionTimeout['\$'];

  AudioEncoderConfiguration(
      this.xmlName,
      this.xmlUseCount,
      this.xmlEncoding,
      this.xmlBitRate,
      this.xmlSampleRate,
      this.multiCast,
      this.xmlSessionTimeout);

  factory AudioEncoderConfiguration.fromJson(Map<String, dynamic> json) =>
      _$AudioEncoderConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$AudioEncoderConfigurationToJson(this);
}
