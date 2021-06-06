import 'package:json_annotation/json_annotation.dart';

part 'h264.g.dart';

@JsonSerializable()

///Optional element to configure H.264 related parameters.
class H264 {
  @JsonKey(name: 'GovLength')
  final dynamic xmlGovLength;

  @JsonKey(name: 'H264Profile')
  final dynamic xmlH264Profile;

  ///Group of Video frames length. Determines typically the interval in which
  ///the I-Frames will be coded. An entry of 1 indicates I-Frames are
  ///continuously generated. An entry of 2 indicates that every 2nd image is an
  ///I-Frame, and 3 only every 3rd frame, etc. The frames in between are coded
  ///as P or B Frames.
  int get govLength => int.parse(xmlGovLength['\$']);

  ///the H.264 profile, either baseline, main, extended or high
  ///- enum { 'Baseline', 'Main', 'Extended', 'High' }
  String get h264Profile => xmlH264Profile['\$'];

  H264(this.xmlGovLength, this.xmlH264Profile);

  factory H264.fromJson(Map<String, dynamic> json) => _$H264FromJson(json);

  Map<String, dynamic> toJson() => _$H264ToJson(this);
}
