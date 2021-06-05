import 'package:json_annotation/json_annotation.dart';

part 'audioDecoderConfiguration.g.dart';

@JsonSerializable(explicitToJson: true)
class AudioDecoderConfiguration {
  @JsonKey(name: '@token')
  final String token;

  @JsonKey(name: 'Name')
  final dynamic xmlName;

  @JsonKey(name: 'UseCount')
  final dynamic xmlUseCount;

  String get name => xmlName['\$'];

  int get useCount => int.parse(xmlUseCount['\$']);

  AudioDecoderConfiguration(this.token, this.xmlName, this.xmlUseCount);

  factory AudioDecoderConfiguration.fromJson(Map<String, dynamic> json) =>
      _$AudioDecoderConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$AudioDecoderConfigurationToJson(this);
}
