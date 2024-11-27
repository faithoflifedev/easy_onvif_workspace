// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recording_configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecordingConfiguration _$RecordingConfigurationFromJson(
        Map<String, dynamic> json) =>
    RecordingConfiguration(
      source: RecordingSourceInformation.fromJson(
          json['Source'] as Map<String, dynamic>),
      content: OnvifUtil.mappedToString(json['Content']),
      maximumRetentionTime:
          OnvifUtil.mappedToString(json['MaximumRetentionTime']),
    );

Map<String, dynamic> _$RecordingConfigurationToJson(
        RecordingConfiguration instance) =>
    <String, dynamic>{
      'Source': instance.source,
      'Content': instance.content,
      'MaximumRetentionTime': instance.maximumRetentionTime,
    };
