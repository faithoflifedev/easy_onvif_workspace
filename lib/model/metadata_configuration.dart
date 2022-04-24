import 'package:json_annotation/json_annotation.dart';

part 'metadata_configuration.g.dart';

@JsonSerializable(explicitToJson: true)
class MetaDataConfiguration {
  @JsonKey(name: '@token')
  final String token;

  @JsonKey(name: 'Name')
  final dynamic xmlName;

  @JsonKey(name: 'UseCount')
  final dynamic xmlUseCount;

  String get name => xmlName['\$'];

  int get useCount => int.parse(xmlUseCount['\$']);

  MetaDataConfiguration(this.token, this.xmlName, this.xmlUseCount);

  factory MetaDataConfiguration.fromJson(Map<String, dynamic> json) =>
      _$MetaDataConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$MetaDataConfigurationToJson(this);
}
