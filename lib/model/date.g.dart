// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Date _$DateFromJson(Map<String, dynamic> json) => Date(
      OnvifUtil.mappedToInt(json['Year'] as Map<String, dynamic>),
      OnvifUtil.mappedToInt(json['Month'] as Map<String, dynamic>),
      OnvifUtil.mappedToInt(json['Day'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DateToJson(Date instance) => <String, dynamic>{
      'Year': instance.year,
      'Month': instance.month,
      'Day': instance.day,
    };
