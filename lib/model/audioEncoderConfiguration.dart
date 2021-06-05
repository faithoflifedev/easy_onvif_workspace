import 'package:json_annotation/json_annotation.dart';

import 'multicast.dart';

part 'audioEncoderConfiguration.g.dart';

@JsonSerializable(explicitToJson: true)
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

  String get name => xmlName['\$'];

  String get encoding => xmlEncoding['\$'];

  int get useCount => int.parse(xmlUseCount['\$']);

  int get bitRate => int.parse(xmlBitRate['\$']);

  int get sampleRate => int.parse(xmlSampleRate['\$']);

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
