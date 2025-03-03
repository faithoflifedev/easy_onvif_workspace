// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recording_configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecordingConfiguration _$RecordingConfigurationFromJson(
  Map<String, dynamic> json,
) => RecordingConfiguration(
  source: RecordingSourceInformation.fromJson(
    json['Source'] as Map<String, dynamic>,
  ),
  content: OnvifUtil.stringMappedFromXml(
    json['Content'] as Map<String, dynamic>,
  ),
  maximumRetentionTime: OnvifUtil.stringMappedFromXml(
    json['MaximumRetentionTime'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$RecordingConfigurationToJson(
  RecordingConfiguration instance,
) => <String, dynamic>{
  'Source': instance.source,
  'Content': instance.content,
  'MaximumRetentionTime': instance.maximumRetentionTime,
};
