// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Date _$DateFromJson(Map<String, dynamic> json) => Date(
      json['Year'],
      json['Month'],
      json['Day'],
    );

Map<String, dynamic> _$DateToJson(Date instance) => <String, dynamic>{
      'Year': instance.xmlYear,
      'Month': instance.xmlMonth,
      'Day': instance.xmlDay,
    };
