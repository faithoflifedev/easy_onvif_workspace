// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Filter _$FilterFromJson(Map<String, dynamic> json) => Filter(
      topic:
          OnvifUtil.stringMappedFromXml(json['Topic'] as Map<String, dynamic>),
      source:
          OnvifUtil.stringMappedFromXml(json['Source'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FilterToJson(Filter instance) => <String, dynamic>{
      'Topic': instance.topic,
      'Source': instance.source,
    };
