// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getPresetResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPresetResponse _$GetPresetResponseFromJson(Map<String, dynamic> json) =>
    GetPresetResponse(
      presets: (json['Preset'] as List<dynamic>)
          .map((e) => Preset.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetPresetResponseToJson(GetPresetResponse instance) =>
    <String, dynamic>{
      'Preset': instance.presets.map((e) => e.toJson()).toList(),
    };
