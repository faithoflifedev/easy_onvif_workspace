// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recording_event_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecordingEventFilter _$RecordingEventFilterFromJson(
        Map<String, dynamic> json) =>
    RecordingEventFilter(
      filters: RecordingEventFilter._fromJson(json['Filter']),
      before: OnvifUtil.nullableMappedToString(
          json['Before'] as Map<String, dynamic>?),
      after: OnvifUtil.nullableMappedToString(
          json['After'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$RecordingEventFilterToJson(
        RecordingEventFilter instance) =>
    <String, dynamic>{
      'Filter': instance.filters,
      'Before': instance.before,
      'After': instance.after,
    };
