import 'package:json_annotation/json_annotation.dart';

part 'ptzConfiguration.g.dart';

///Optional configuration of the pan tilt zoom unit.
@JsonSerializable(explicitToJson: true)
class PTZConfiguration {
  @JsonKey(name: 'Name')
  final dynamic xmlName;

  @JsonKey(name: 'UseCount')
  final dynamic xmlUseCount;

  ///A mandatory reference to the PTZ Node that the PTZ Configuration belongs
  ///to.
  @JsonKey(name: 'NodeToken')
  final dynamic nodeToken;

  ///User readable name. Length up to 64 characters.
  String get name => xmlName['\$'];

  ///Number of internal references currently using this configuration.
  ///This informational parameter is read-only. Deprecated for Media2 Service.
  int get useCount => int.parse(xmlUseCount['\$']);

  PTZConfiguration(this.xmlName, this.xmlUseCount, this.nodeToken);

  factory PTZConfiguration.fromJson(Map<String, dynamic> json) =>
      _$PTZConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$PTZConfigurationToJson(this);
}
