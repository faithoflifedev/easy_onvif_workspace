import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'info.dart';

part 'get_video_encoder_instances_response.g.dart';

/// The GetVideoEncoderInstances command can be used to request the minimum
/// number of guaranteed video encoder instances (applications) per Video Source
/// Configuration.
@JsonSerializable()
class GetVideoEncoderInstancesResponse {
  /// The minimum guaranteed total number of encoder instances (applications)
  /// per VideoSourceConfiguration.
  @JsonKey(name: 'Info')
  final Info info;

  GetVideoEncoderInstancesResponse({required this.info});

  factory GetVideoEncoderInstancesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetVideoEncoderInstancesResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetVideoEncoderInstancesResponseToJson(this);

  @override
  String toString() => json.encode(toJson());
}
