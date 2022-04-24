import 'package:json_annotation/json_annotation.dart';

part 'version.g.dart';

@JsonSerializable()
class Version {
  @JsonKey(name: 'Major')
  final dynamic xmlMajor;
  // final String major;

  @JsonKey(name: 'Minor')
  final dynamic xmlMinor;
  // final String minor;

  int get major => int.parse(xmlMajor['\$']);

  int get minor => int.parse(xmlMinor['\$']);

  Version(this.xmlMajor, this.xmlMinor);

  factory Version.fromJson(Map<String, dynamic> json) =>
      _$VersionFromJson(json);

  Map<String, dynamic> toJson() => _$VersionToJson(this);
}
