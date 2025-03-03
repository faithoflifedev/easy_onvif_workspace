// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'space_1d.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Space1D _$Space1DFromJson(Map<String, dynamic> json) => Space1D(
  uri: OnvifUtil.stringMappedFromXml(json['URI'] as Map<String, dynamic>),
  xRange: FloatRange.fromJson(json['XRange'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Space1DToJson(Space1D instance) => <String, dynamic>{
  'URI': instance.uri,
  'XRange': instance.xRange,
};
