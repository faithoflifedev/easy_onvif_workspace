// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'duration_range.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DurationRange _$DurationRangeFromJson(Map<String, dynamic> json) =>
    DurationRange(
      min: OnvifUtil.mappedToString(json['Min']),
      max: OnvifUtil.mappedToString(json['Max']),
    );

Map<String, dynamic> _$DurationRangeToJson(DurationRange instance) =>
    <String, dynamic>{
      'Min': instance.min,
      'Max': instance.max,
    };
