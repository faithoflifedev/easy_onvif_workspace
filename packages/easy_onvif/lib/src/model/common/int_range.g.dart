// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'int_range.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IntRange _$IntRangeFromJson(Map<String, dynamic> json) => IntRange(
      min: OnvifUtil.intMappedFromXml(json['Min'] as Map<String, dynamic>),
      max: OnvifUtil.intMappedFromXml(json['Max'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IntRangeToJson(IntRange instance) => <String, dynamic>{
      'Min': instance.min,
      'Max': instance.max,
    };
