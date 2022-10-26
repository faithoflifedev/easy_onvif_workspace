// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Analytics _$AnalyticsFromJson(Map<String, dynamic> json) => Analytics(
      OnvifUtil.mappedToString(json['XAddr'] as Map<String, dynamic>),
      OnvifUtil.mappedToBool(json['RuleSupport'] as Map<String, dynamic>),
      OnvifUtil.mappedToBool(
          json['AnalyticsModuleSupport'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnalyticsToJson(Analytics instance) => <String, dynamic>{
      'XAddr': instance.xAddr,
      'RuleSupport': instance.ruleSupport,
      'AnalyticsModuleSupport': instance.analyticsModuleSupport,
    };
