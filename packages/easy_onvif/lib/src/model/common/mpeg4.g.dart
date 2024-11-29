// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mpeg4.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mpeg4 _$Mpeg4FromJson(Map<String, dynamic> json) => Mpeg4(
      govLength:
          OnvifUtil.intMappedFromXml(json['GovLength'] as Map<String, dynamic>),
      mpeg4Profile: OnvifUtil.stringMappedFromXml(
          json['Mpeg4Profile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$Mpeg4ToJson(Mpeg4 instance) => <String, dynamic>{
      'GovLength': instance.govLength,
      'Mpeg4Profile': instance.mpeg4Profile,
    };
