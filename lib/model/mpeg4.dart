import 'package:json_annotation/json_annotation.dart';

part 'mpeg4.g.dart';

@JsonSerializable()

///Optional element to configure Mpeg4 related parameters.
class Mpeg4 {
  @JsonKey(name: 'GovLength')
  final dynamic xmlGovLength;

  @JsonKey(name: 'Mpeg4Profile')
  final dynamic xmlMpeg4Profile;

  ///Determines the interval in which the I-Frames will be coded. An entry of 1
  ///indicates I-Frames are continuously generated. An entry of 2 indicates that
  ///every 2nd image is an I-Frame, and 3 only every 3rd frame, etc. The frames
  ///in between are coded as P or B Frames.
  int get govLength => int.parse(xmlGovLength['\$']);

  ///the Mpeg4 profile, either simple profile (SP) or advanced simple profile
  ///(ASP)
  ///- enum { 'SP', 'ASP' }
  String get mpeg4Profile => xmlMpeg4Profile['\$'];

  Mpeg4(this.xmlGovLength, this.xmlMpeg4Profile);

  factory Mpeg4.fromJson(Map<String, dynamic> json) => _$Mpeg4FromJson(json);

  Map<String, dynamic> toJson() => _$Mpeg4ToJson(this);
}
