import 'dart:convert';

import 'package:easy_onvif/shared.dart';
import 'package:easy_onvif/src/util/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'preset.g.dart';

@JsonSerializable()
class Preset {
  @JsonKey(name: '@token')
  final String token;

  @JsonKey(name: 'Name', fromJson: OnvifUtil.mappedToString)
  final String name;

  @JsonKey(name: 'PTZPosition')
  final PtzVector? position;

  ReferenceToken get referenceToken => ReferenceToken(token);

  Preset({
    required this.token,
    required this.name,
    this.position,
  });

  factory Preset.fromJson(Map<String, dynamic> json) => _$PresetFromJson(json);

  factory Preset.fromToken(String token, {String? name}) => Preset(
        token: token,
        name: name ?? '',
      );

  Map<String, dynamic> toJson() => _$PresetToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
