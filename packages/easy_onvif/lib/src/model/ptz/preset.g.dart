// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Preset _$PresetFromJson(Map<String, dynamic> json) => Preset(
      token: json['@token'] as String,
      name: OnvifUtil.mappedToString(json['Name']),
      position: json['PTZPosition'] == null
          ? null
          : PtzVector.fromJson(json['PTZPosition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PresetToJson(Preset instance) => <String, dynamic>{
      '@token': instance.token,
      'Name': instance.name,
      'PTZPosition': instance.position,
    };
