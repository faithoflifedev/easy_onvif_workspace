import 'package:json_annotation/json_annotation.dart';

part 'analytics.g.dart';

@JsonSerializable(explicitToJson: true)
class Analytics {
  @JsonKey(name: 'XAddr')
  final dynamic xmlXAddr;

  @JsonKey(name: 'RuleSupport')
  final dynamic xmlRuleSupport;

  @JsonKey(name: 'AnalyticsModuleSupport')
  final dynamic xmlAnalyticsModuleSupport;

  String get xAddr => xmlXAddr['\$'];

  bool get ruleSupport => xmlRuleSupport['\$'].toLowerCase() == 'true';

  bool get analyticsModuleSupport =>
      xmlAnalyticsModuleSupport['\$'].toLowerCase() == 'true';

  Analytics(this.xmlXAddr, this.xmlRuleSupport, this.xmlAnalyticsModuleSupport);

  factory Analytics.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsFromJson(json);

  Map<String, dynamic> toJson() => _$AnalyticsToJson(this);
}
