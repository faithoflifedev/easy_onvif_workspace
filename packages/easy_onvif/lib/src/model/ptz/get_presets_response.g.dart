// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_presets_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPresetsResponse _$GetPresetsResponseFromJson(Map<String, dynamic> json) =>
    GetPresetsResponse(
      presets: GetPresetsResponse._listIfEmpty(json['Preset'] as List?),
    );

Map<String, dynamic> _$GetPresetsResponseToJson(GetPresetsResponse instance) =>
    <String, dynamic>{'Preset': instance.presets};
