import 'package:json_annotation/json_annotation.dart';

part 'h264.g.dart';

@JsonSerializable()
class H264 {
  @JsonKey(name: 'GovLength')
  final dynamic xmlGovLength;

  @JsonKey(name: 'H264Profile')
  final dynamic xmlH264Profile;

  int get govLength => int.parse(xmlGovLength['\$']);

  String get h264Profile => xmlH264Profile['\$'];

  H264(this.xmlGovLength, this.xmlH264Profile);

  factory H264.fromJson(Map<String, dynamic> json) => _$H264FromJson(json);

  Map<String, dynamic> toJson() => _$H264ToJson(this);
}
