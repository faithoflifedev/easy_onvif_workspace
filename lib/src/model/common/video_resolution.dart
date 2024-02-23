import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'resolution.dart';

part 'video_resolution.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class VideoResolution extends Resolution {
  VideoResolution({
    required super.width,
    required super.height,
  });

  factory VideoResolution.fromJson(Map<String, dynamic> json) =>
      _$VideoResolutionFromJson(json);
}
