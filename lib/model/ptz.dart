import 'package:json_annotation/json_annotation.dart';

part 'ptz.g.dart';

@JsonSerializable(explicitToJson: true)
class Ptz {
  @JsonKey(name: 'XAddr')
  final dynamic xmlXAddr;

  String get xaddr => xmlXAddr['\$'];

  Ptz(this.xmlXAddr);

  factory Ptz.fromJson(Map<String, dynamic> json) => _$PtzFromJson(json);

  Map<String, dynamic> toJson() => _$PtzToJson(this);
}
