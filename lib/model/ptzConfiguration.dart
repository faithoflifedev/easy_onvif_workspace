import 'package:json_annotation/json_annotation.dart';

part 'ptzConfiguration.g.dart';

@JsonSerializable(explicitToJson: true)
class PTZConfiguration {
  @JsonKey(name: 'Name')
  final dynamic xmlName;

  @JsonKey(name: 'UseCount')
  final dynamic xmlUseCount;

  @JsonKey(name: 'NodeToken')
  final dynamic nodeToken;

  String get name => xmlName['\$'];

  int get useCount => int.parse(xmlUseCount['\$']);

  PTZConfiguration(this.xmlName, this.xmlUseCount, this.nodeToken);

  factory PTZConfiguration.fromJson(Map<String, dynamic> json) =>
      _$PTZConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$PTZConfigurationToJson(this);
}
