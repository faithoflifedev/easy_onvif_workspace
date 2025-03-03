import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'analytics_capabilities.g.dart';

/// Analytics capabilities
@JsonSerializable()
class AnalyticsCapabilities {
  static final _xmlMappedFields = <String>[
    'XAddr',
    'RuleSupport',
    'AnalyticsModuleSupport',
  ];

  /// Analytics service URI.
  @JsonKey(name: 'XAddr', fromJson: OnvifUtil.stringMappedFromXml)
  final String xAddr;

  /// Indicates whether or not rules are supported.
  @JsonKey(name: 'RuleSupport', fromJson: OnvifUtil.boolMappedFromXml)
  final bool ruleSupport;

  /// Indicates whether or not modules are supported.
  @JsonKey(
    name: 'AnalyticsModuleSupport',
    fromJson: OnvifUtil.boolMappedFromXml,
  )
  final bool analyticsModuleSupport;

  AnalyticsCapabilities(
    this.xAddr,
    this.ruleSupport,
    this.analyticsModuleSupport,
  );

  factory AnalyticsCapabilities.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsCapabilitiesFromJson(json);

  Map<String, dynamic> toJson() => _$AnalyticsCapabilitiesToJson(
    this,
  ).convertFieldsToXmlMap(_xmlMappedFields);

  @override
  String toString() => json.encode(toJson());
}
