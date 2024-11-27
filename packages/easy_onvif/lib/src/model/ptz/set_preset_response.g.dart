// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_preset_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetPresetResponse _$SetPresetResponseFromJson(Map<String, dynamic> json) =>
    SetPresetResponse(
      presetToken: OnvifUtil.mappedToString(json['PresetToken']),
    );

Map<String, dynamic> _$SetPresetResponseToJson(SetPresetResponse instance) =>
    <String, dynamic>{
      'PresetToken': instance.presetToken,
    };
