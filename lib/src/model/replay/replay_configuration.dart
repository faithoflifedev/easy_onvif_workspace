import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'replay_configuration.g.dart';

/// The current replay configuration parameters.
@JsonSerializable()
class ReplayConfiguration {
  /// The RTSP session timeout.
  @JsonKey(name: 'SessionTimeout', fromJson: OnvifUtil.mappedToString)
  final String sessionTimeout;

  ReplayConfiguration({required this.sessionTimeout});

  factory ReplayConfiguration.fromJson(Map<String, dynamic> json) =>
      _$ReplayConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$ReplayConfigurationToJson(this);

  @override
  String toString() => json.encode(toJson());
}
