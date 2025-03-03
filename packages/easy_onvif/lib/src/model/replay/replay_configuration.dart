import 'dart:convert';

import 'package:easy_onvif/shared.dart';
import 'package:easy_onvif/soap.dart' show Xmlns;
import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:xml/xml.dart';

part 'replay_configuration.g.dart';

/// The current replay configuration parameters.
@JsonSerializable()
class ReplayConfiguration implements XmlSerializable {
  /// The RTSP session timeout.
  @JsonKey(name: 'SessionTimeout', fromJson: OnvifUtil.stringMappedFromXml)
  final String sessionTimeout;

  ReplayConfiguration({required this.sessionTimeout});

  factory ReplayConfiguration.fromJson(Map<String, dynamic> json) =>
      _$ReplayConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$ReplayConfigurationToJson(this);

  @override
  String toString() => json.encode(toJson());

  @override
  void buildXml(
    XmlBuilder builder, {
    String tag = 'Configuration',
    String? namespace,
  }) => builder.element(
    tag,
    nest: () {
      sessionTimeout.buildXml(
        builder,
        tag: 'SessionTimeout',
        namespace: Xmlns.tt,
      );
    },
  );
}
