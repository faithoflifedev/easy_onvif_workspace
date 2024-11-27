// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mpeg4.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mpeg4 _$Mpeg4FromJson(Map<String, dynamic> json) => Mpeg4(
      govLength:
          OnvifUtil.mappedToInt(json['GovLength'] as Map<String, dynamic>),
      mpeg4Profile: OnvifUtil.mappedToString(json['Mpeg4Profile']),
    );

Map<String, dynamic> _$Mpeg4ToJson(Mpeg4 instance) => <String, dynamic>{
      'GovLength': instance.govLength,
      'Mpeg4Profile': instance.mpeg4Profile,
    };
