// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'white_balance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WhiteBalance _$WhiteBalanceFromJson(Map<String, dynamic> json) => WhiteBalance(
      mode: OnvifUtil.stringMappedFromXml(json['Mode'] as Map<String, dynamic>),
      crGain:
          OnvifUtil.doubleMappedFromXml(json['CrGain'] as Map<String, dynamic>),
      cbGain:
          OnvifUtil.doubleMappedFromXml(json['CbGain'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WhiteBalanceToJson(WhiteBalance instance) =>
    <String, dynamic>{
      'Mode': instance.mode,
      'CrGain': instance.crGain,
      'CbGain': instance.cbGain,
    };
