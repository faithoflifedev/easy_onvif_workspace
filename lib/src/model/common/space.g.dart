// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'space.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Space _$SpaceFromJson(Map<String, dynamic> json) => Space(
      min: OnvifUtil.mappedToDouble(json['Min'] as Map<String, dynamic>),
      max: OnvifUtil.mappedToDouble(json['Max'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SpaceToJson(Space instance) => <String, dynamic>{
      'Min': instance.min,
      'Max': instance.max,
    };
