// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'float_range.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FloatRange _$FloatRangeFromJson(Map<String, dynamic> json) => FloatRange(
  min: OnvifUtil.doubleMappedFromXml(json['Min'] as Map<String, dynamic>),
  max: OnvifUtil.doubleMappedFromXml(json['Max'] as Map<String, dynamic>),
);

Map<String, dynamic> _$FloatRangeToJson(FloatRange instance) =>
    <String, dynamic>{'Min': instance.min, 'Max': instance.max};
