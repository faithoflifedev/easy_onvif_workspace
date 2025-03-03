// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'duration_range.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DurationRange _$DurationRangeFromJson(Map<String, dynamic> json) =>
    DurationRange(
      min: OnvifUtil.stringMappedFromXml(json['Min'] as Map<String, dynamic>),
      max: OnvifUtil.stringMappedFromXml(json['Max'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DurationRangeToJson(DurationRange instance) =>
    <String, dynamic>{'Min': instance.min, 'Max': instance.max};
