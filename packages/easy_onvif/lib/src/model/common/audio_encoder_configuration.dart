import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:easy_onvif/shared.dart';

part 'audio_encoder_configuration.g.dart';

///The requested audio encoder configuration
@JsonSerializable()
class AudioEncoderConfiguration {
  static final _xmlMappedFields = <String>[
    'Name',
    'UseCount',
    'Encoding',
    'Bitrate',
    'SampleRate',
    'Multicast',
    'SessionTimeout',
  ];

  ///User readable name. Length up to 64 characters.
  @JsonKey(name: 'Name', fromJson: OnvifUtil.stringMappedFromXml)
  final String name;

  /// Number of internal references currently using this configuration.
  /// This informational parameter is read-only. Deprecated for Media2 Service.
  @JsonKey(name: 'UseCount', fromJson: OnvifUtil.intMappedFromXml)
  final int useCount;

  /// Audio codec used for encoding the audio input (either G.711, G.726 or AAC)
  /// - enum { 'G711', 'G726', 'AAC' }
  @JsonKey(name: 'Encoding', fromJson: mappedToAudioCodecEncoding)
  final AudioCodecEncoding audioCodecEncoding;

  /// The output bitrate in kbps.
  @JsonKey(name: 'Bitrate', fromJson: OnvifUtil.intMappedFromXml)
  final int bitRate;

  /// The output sample rate in kHz.
  @JsonKey(name: 'SampleRate', fromJson: OnvifUtil.intMappedFromXml)
  final int sampleRate;

  @JsonKey(name: 'Multicast', fromJson: OnvifUtil.emptyOrMulticastConfiguration)
  final MulticastConfiguration? multiCast;

  /// The RTSP session timeout for the related audio stream
  @JsonKey(name: 'SessionTimeout', fromJson: OnvifUtil.stringMappedFromXml)
  final String sessionTimeout;

  AudioEncoderConfiguration(
    this.name,
    this.useCount,
    this.audioCodecEncoding,
    this.bitRate,
    this.sampleRate,
    this.multiCast,
    this.sessionTimeout,
  );

  factory AudioEncoderConfiguration.fromJson(Map<String, dynamic> json) =>
      _$AudioEncoderConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$AudioEncoderConfigurationToJson(
    this,
  ).convertFieldsToXmlMap(_xmlMappedFields);

  static AudioCodecEncoding mappedToAudioCodecEncoding(
    Map<String, dynamic> value,
  ) => AudioCodecEncoding.values.byName(
    OnvifUtil.stringMappedFromXml(value).toLowerCase(),
  );

  @override
  String toString() => json.encode(toJson());
}

@JsonEnum()
enum AudioCodecEncoding {
  g711('G711'),
  g726('G726'),
  aac('AAC');

  const AudioCodecEncoding(this.value);

  final String value;
}
