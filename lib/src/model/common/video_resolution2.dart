import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'resolution.dart';

part 'video_resolution2.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class VideoResolution2 extends Resolution {
  VideoResolution2({required super.width, required super.height});

  factory VideoResolution2.fromJson(Map<String, dynamic> json) =>
      _$VideoResolution2FromJson(json);
}
