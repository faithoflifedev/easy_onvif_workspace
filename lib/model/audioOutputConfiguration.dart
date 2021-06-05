import 'package:json_annotation/json_annotation.dart';

part 'audioOutputConfiguration.g.dart';

@JsonSerializable(explicitToJson: true)
class AudioOutputConfiguration {
  @JsonKey(name: '@token')
  final String token;

  @JsonKey(name: 'Name')
  final dynamic xmlName;

  @JsonKey(name: 'UseCount')
  final dynamic xmlUseCount;

  @JsonKey(name: 'OutputToken')
  final dynamic xmlOutputToken;

  @JsonKey(name: 'SendPrimacy')
  final dynamic xmlSendPrimacy;

  @JsonKey(name: 'OutputLevel')
  final dynamic xmlOutputLevel;

  String get name => xmlName['\$'];

  int get useCount => int.parse(xmlUseCount['\$']);

  String get outputToken => xmlOutputToken['\$'];

  String get sendPrimacy => xmlSendPrimacy['\$'];

  int get outputLevel => int.parse(xmlOutputLevel['\$']);

  AudioOutputConfiguration(this.token, this.xmlName, this.xmlUseCount,
      this.xmlOutputToken, this.xmlSendPrimacy, this.xmlOutputLevel);

  factory AudioOutputConfiguration.fromJson(Map<String, dynamic> json) =>
      _$AudioOutputConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$AudioOutputConfigurationToJson(this);
}
