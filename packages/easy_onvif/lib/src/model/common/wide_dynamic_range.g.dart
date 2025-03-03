// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wide_dynamic_range.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WideDynamicRange _$WideDynamicRangeFromJson(Map<String, dynamic> json) =>
    WideDynamicRange(
      mode: OnvifUtil.stringMappedFromXml(json['Mode'] as Map<String, dynamic>),
      level: OnvifUtil.doubleMappedFromXml(
        json['Level'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$WideDynamicRangeToJson(WideDynamicRange instance) =>
    <String, dynamic>{'Mode': instance.mode, 'Level': instance.level};
