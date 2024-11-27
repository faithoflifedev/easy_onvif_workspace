// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Filter _$FilterFromJson(Map<String, dynamic> json) => Filter(
      topic: OnvifUtil.mappedToString(json['Topic']),
      source: OnvifUtil.mappedToString(json['Source']),
    );

Map<String, dynamic> _$FilterToJson(Filter instance) => <String, dynamic>{
      'Topic': instance.topic,
      'Source': instance.source,
    };
