// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Preset _$PresetFromJson(Map<String, dynamic> json) => Preset(
      token: json['@token'] as String,
      xmlName: json['Name'],
      position:
          PtzPosition.fromJson(json['PTZPosition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PresetToJson(Preset instance) => <String, dynamic>{
      '@token': instance.token,
      'Name': instance.xmlName,
      'PTZPosition': instance.position.toJson(),
    };
