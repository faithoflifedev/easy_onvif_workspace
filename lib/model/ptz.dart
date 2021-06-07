import 'package:json_annotation/json_annotation.dart';

part 'ptz.g.dart';

///PTZ capabilities
@JsonSerializable(explicitToJson: true)
class Ptz {
  @JsonKey(name: 'XAddr')
  final dynamic xmlXAddr;

  ///PTZ service URI.
  String get xaddr => xmlXAddr['\$'];

  Ptz(this.xmlXAddr);

  factory Ptz.fromJson(Map<String, dynamic> json) => _$PtzFromJson(json);

  Map<String, dynamic> toJson() => _$PtzToJson(this);
}
