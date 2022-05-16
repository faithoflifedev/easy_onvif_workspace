import 'package:easy_onvif/onvif.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ptz.g.dart';

///PTZ capabilities
@JsonSerializable(explicitToJson: true)
class Ptz {
  ///PTZ service URI.
  @JsonKey(name: 'XAddr', fromJson: OnvifUtil.mappedToString)
  final String xAddr;

  Ptz({required this.xAddr});

  factory Ptz.fromJson(Map<String, dynamic> json) => _$PtzFromJson(json);

  Map<String, dynamic> toJson() => _$PtzToJson(this);
}
