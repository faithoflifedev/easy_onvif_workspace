// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobOptions _$JobOptionsFromJson(Map<String, dynamic> json) => JobOptions(
  spare: int.parse(json['@Spare'] as String),
  compatibleSources: OnvifUtil.stringToList(
    json['@CompatibleSources'] as String,
  ),
);

Map<String, dynamic> _$JobOptionsToJson(JobOptions instance) =>
    <String, dynamic>{
      '@Spare': instance.spare,
      '@CompatibleSources': instance.compatibleSources,
    };
