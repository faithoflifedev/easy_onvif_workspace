import 'package:easy_onvif/util/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'media.g.dart';

///Media capabilities
@JsonSerializable()
class Media {
  ///Media service URI.
  @JsonKey(name: 'XAddr', fromJson: OnvifUtil.mappedToString)
  final String xaddr;

  Media({required this.xaddr});

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);

  Map<String, dynamic> toJson() => _$MediaToJson(this);
}
