import 'package:json_annotation/json_annotation.dart';

part 'audioSourceConfiguration.g.dart';

@JsonSerializable(explicitToJson: true)
class AudioSourceConfiguration {
  @JsonKey(name: 'Name')
  final dynamic xmlName;

  @JsonKey(name: 'UseCount')
  final dynamic xmlUseCount;

  @JsonKey(name: 'SourceToken')
  final dynamic sourceToken;

  String get name => xmlName['\$'];

  int get useCount => int.parse(xmlUseCount['\$']);

  AudioSourceConfiguration(this.xmlName, this.xmlUseCount, this.sourceToken);

  factory AudioSourceConfiguration.fromJson(Map<String, dynamic> json) =>
      _$AudioSourceConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$AudioSourceConfigurationToJson(this);
}
