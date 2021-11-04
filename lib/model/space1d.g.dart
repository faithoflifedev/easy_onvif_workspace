// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'space1d.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Space1D _$Space1DFromJson(Map<String, dynamic> json) => Space1D(
      xmlUri: json['Capabilities'],
      xRange: Space.fromJson(json['XRange'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$Space1DToJson(Space1D instance) => <String, dynamic>{
      'Capabilities': instance.xmlUri,
      'XRange': instance.xRange,
    };
