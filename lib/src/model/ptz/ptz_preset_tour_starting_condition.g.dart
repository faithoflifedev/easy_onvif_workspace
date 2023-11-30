// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ptz_preset_tour_starting_condition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PtzPresetTourStartingCondition _$PtzPresetTourStartingConditionFromJson(
        Map<String, dynamic> json) =>
    PtzPresetTourStartingCondition(
      randomPresetOrder: OnvifUtil.nullableMappedToBool(
          json['RandomPresetOrder'] as Map<String, dynamic>?),
      recurringTime: json['RecurringTime'] as int?,
      recurringDuration: json['RecurringDuration'] as String?,
      direction: PtzPresetTourStartingCondition._fix(
          json['Direction'] as Map<String, dynamic>?),
      extension: json['Extension'],
    );

Map<String, dynamic> _$PtzPresetTourStartingConditionToJson(
        PtzPresetTourStartingCondition instance) =>
    <String, dynamic>{
      'RandomPresetOrder': instance.randomPresetOrder,
      'RecurringTime': instance.recurringTime,
      'RecurringDuration': instance.recurringDuration,
      'Direction': _$PtzPresetTourDirectionEnumMap[instance.direction],
      'Extension': instance.extension,
    };

const _$PtzPresetTourDirectionEnumMap = {
  PtzPresetTourDirection.forward: 'Forward',
  PtzPresetTourDirection.backward: 'Backward',
  PtzPresetTourDirection.extended: 'Extended',
};
