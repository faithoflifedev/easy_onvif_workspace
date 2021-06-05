import 'package:json_annotation/json_annotation.dart';

part 'supportedVersion.g.dart';

@JsonSerializable(explicitToJson: true)
class SupportedVersion {
  @JsonKey(name: 'Major')
  final dynamic xmlMajor;

  @JsonKey(name: 'Minor')
  final dynamic xmlMinor;

  String get major => xmlMajor['\$'];

  String get minor => xmlMinor['\$'];

  SupportedVersion(this.xmlMajor, this.xmlMinor);

  factory SupportedVersion.fromJson(Map<String, dynamic> json) =>
      _$SupportedVersionFromJson(json);

  Map<String, dynamic> toJson() => _$SupportedVersionToJson(this);
}
