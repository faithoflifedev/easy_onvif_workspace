// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ptz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ptz _$PtzFromJson(Map<String, dynamic> json) => Ptz(
      xAddr: OnvifUtil.mappedToString(json['XAddr'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PtzToJson(Ptz instance) => <String, dynamic>{
      'XAddr': instance.xAddr,
    };
