import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'job_options.g.dart';

@JsonSerializable()
class JobOptions {
  /// Number of spare jobs that can be created for the recording.
  @JsonKey(name: '@Spare', fromJson: int.parse)
  final int spare;

  /// A device that supports recording of a restricted set of Media/Media2
  /// Service Profiles returns the list of profiles that can be recorded on the
  /// given Recording.
  @JsonKey(name: '@CompatibleSources', fromJson: OnvifUtil.stringToList)
  final List<String> compatibleSources;

  JobOptions({
    required this.spare,
    required this.compatibleSources,
  });

  factory JobOptions.fromJson(Map<String, dynamic> json) =>
      _$JobOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$JobOptionsToJson(this);

  @override
  String toString() => json.encode(toJson());
}
