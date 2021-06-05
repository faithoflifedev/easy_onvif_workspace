import 'package:json_annotation/json_annotation.dart';

part 'version.g.dart';

@JsonSerializable()
class Version {
  @JsonKey(name: 'Major')
  final String major;

  @JsonKey(name: 'Minor')
  final String minor;

  Version(this.major, this.minor);

  factory Version.fromJson(Map<String, dynamic> json) =>
      _$VersionFromJson(json);

  Map<String, dynamic> toJson() => _$VersionToJson(this);
}
