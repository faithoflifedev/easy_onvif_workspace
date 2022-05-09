import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'analytics.g.dart';

///Analytics capabilities
@JsonSerializable(explicitToJson: true)
class Analytics {
  @JsonKey(name: 'XAddr')
  final dynamic xmlXAddr;

  @JsonKey(name: 'RuleSupport')
  final dynamic xmlRuleSupport;

  @JsonKey(name: 'AnalyticsModuleSupport')
  final dynamic xmlAnalyticsModuleSupport;

  ///Analytics service URI.
  String get xAddr => xmlXAddr['\$'];

  ///Indicates whether or not rules are supported.
  bool get ruleSupport => xmlRuleSupport['\$'].toLowerCase() == 'true';

  ///Indicates whether or not modules are supported.
  bool get analyticsModuleSupport =>
      xmlAnalyticsModuleSupport['\$'].toLowerCase() == 'true';

  Analytics(this.xmlXAddr, this.xmlRuleSupport, this.xmlAnalyticsModuleSupport);

  factory Analytics.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsFromJson(json);

  Map<String, dynamic> toJson() => _$AnalyticsToJson(this);

  @override
  String toString() => json.encode(toJson());
}
