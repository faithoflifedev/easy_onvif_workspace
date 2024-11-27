// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_capabilities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnalyticsCapabilities _$AnalyticsCapabilitiesFromJson(
        Map<String, dynamic> json) =>
    AnalyticsCapabilities(
      OnvifUtil.mappedToString(json['XAddr']),
      OnvifUtil.mappedToBool(json['RuleSupport'] as Map<String, dynamic>),
      OnvifUtil.mappedToBool(
          json['AnalyticsModuleSupport'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnalyticsCapabilitiesToJson(
        AnalyticsCapabilities instance) =>
    <String, dynamic>{
      'XAddr': instance.xAddr,
      'RuleSupport': instance.ruleSupport,
      'AnalyticsModuleSupport': instance.analyticsModuleSupport,
    };
