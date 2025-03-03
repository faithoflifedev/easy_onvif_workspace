// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_current_preset_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCurrentPresetResponse _$GetCurrentPresetResponseFromJson(
  Map<String, dynamic> json,
) => GetCurrentPresetResponse(
  preset: ImagingPreset.fromJson(json['Preset'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetCurrentPresetResponseToJson(
  GetCurrentPresetResponse instance,
) => <String, dynamic>{'Preset': instance.preset};
