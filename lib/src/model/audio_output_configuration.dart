import 'dart:convert';

import 'package:easy_onvif/onvif.dart';
import 'package:json_annotation/json_annotation.dart';

part 'audio_output_configuration.g.dart';

@JsonSerializable(explicitToJson: true)
class AudioOutputConfiguration {
  ///Token that uniquely references this configuration. Length up to 64 characters.
  @JsonKey(name: '@token')
  final String token;

  ///User readable name. Length up to 64 characters.
  @JsonKey(name: 'Name', fromJson: OnvifUtil.mappedToString)
  final String name;

  ///Number of internal references currently using this configuration.
  ///This informational parameter is read-only. Deprecated for Media2 Service.
  @JsonKey(name: 'UseCount', fromJson: OnvifUtil.mappedToInt)
  final int useCount;

  ///Token of the phsycial Audio output.
  @JsonKey(name: 'OutputToken', fromJson: OnvifUtil.mappedToString)
  final String outputToken;

  ///An audio channel MAY support different types of audio transmission. While
  ///for full duplex operation no special handling is required, in half duplex
  ///operation the transmission direction needs to be switched. The optional
  ///SendPrimacy parameter inside the AudioOutputConfiguration indicates which
  ///direction is currently active. An NVC can switch between different modes by
  ///setting the AudioOutputConfiguration.
  ///The following modes for the Send-Primacy are defined:
  ///- www.onvif.org/ver20/HalfDuplex/Server The server is allowed to send audio
  ///data to the client. The client shall not send audio data via the
  ///backchannel to the NVT in this mode.
  ///- www.onvif.org/ver20/HalfDuplex/Client The client is allowed to send audio
  ///data via the backchannel to the server. The NVT shall not send audio data
  ///to the client in this mode.
  ///- www.onvif.org/ver20/HalfDuplex/Auto It is up to the device how to deal
  ///with sending and receiving audio data.
  ///Acoustic echo cancellation is out of ONVIF scope.
  @JsonKey(name: 'SendPrimacy', fromJson: OnvifUtil.mappedToString)
  final String sendPrimacy;

  ///Volume setting of the output. The applicable range is defined via the
  ///option AudioOutputOptions.OutputLevelRange.
  @JsonKey(name: 'OutputLevel', fromJson: OnvifUtil.mappedToInt)
  final int outputLevel;

  AudioOutputConfiguration(this.token, this.name, this.useCount,
      this.outputToken, this.sendPrimacy, this.outputLevel);

  factory AudioOutputConfiguration.fromJson(Map<String, dynamic> json) =>
      _$AudioOutputConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$AudioOutputConfigurationToJson(this);

  @override
  String toString() => json.encode(toJson());
}
