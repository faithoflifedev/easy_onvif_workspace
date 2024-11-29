// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Date _$DateFromJson(Map<String, dynamic> json) => Date(
      OnvifUtil.intMappedFromXml(json['Year'] as Map<String, dynamic>),
      OnvifUtil.intMappedFromXml(json['Month'] as Map<String, dynamic>),
      OnvifUtil.intMappedFromXml(json['Day'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DateToJson(Date instance) => <String, dynamic>{
      'Year': instance.year,
      'Month': instance.month,
      'Day': instance.day,
    };
