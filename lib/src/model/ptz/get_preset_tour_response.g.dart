// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_preset_tour_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPresetTourResponse _$GetPresetTourResponseFromJson(
        Map<String, dynamic> json) =>
    GetPresetTourResponse(
      presetTour:
          PresetTour.fromJson(json['PresetTour'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetPresetTourResponseToJson(
        GetPresetTourResponse instance) =>
    <String, dynamic>{
      'PresetTour': instance.presetTour,
    };
