import 'dart:convert';

import 'package:easy_onvif/onvif.dart';
import 'package:json_annotation/json_annotation.dart';

part 'resolution.g.dart';

@JsonSerializable()

///Configured video resolution
class Resolution {
  ///Number of the columns of the Video image.
  @JsonKey(name: 'Width', fromJson: OnvifUtil.mappedToInt)
  final int width;

  ///Number of the lines of the Video image.
  @JsonKey(name: 'Height', fromJson: OnvifUtil.mappedToInt)
  final int height;

  Resolution({required this.width, required this.height});

  factory Resolution.fromJson(Map<String, dynamic> json) =>
      _$ResolutionFromJson(json);

  Map<String, dynamic> toJson() => _$ResolutionToJson(this);

  @override
  String toString() => json.encode(toJson());
}
