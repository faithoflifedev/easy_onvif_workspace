import 'dart:convert';

// import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'video_encoder2_configuration.dart';

part 'get_video_encoder_configurations_response.g.dart';

/// By default this operation lists all existing video encoder configurations
/// for a device. Provide a profile token to list only configurations that are
/// compatible with the profile. If a configuration token is provided only a
/// single configuration will be returned.
@JsonSerializable()
class GetVideoEncoderConfigurationsResponse {
  /// This element contains a list of video encoder configurations.
  @JsonKey(name: 'Configurations')
  final List<VideoEncoder2Configuration> configurations;

  GetVideoEncoderConfigurationsResponse({required this.configurations});

  factory GetVideoEncoderConfigurationsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetVideoEncoderConfigurationsResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetVideoEncoderConfigurationsResponseToJson(this);

  @override
  String toString() => json.encode(toJson());
}
