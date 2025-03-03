// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_source_configuration_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoSourceConfigurationOptions _$VideoSourceConfigurationOptionsFromJson(
  Map<String, dynamic> json,
) => VideoSourceConfigurationOptions(
  maximumNumberOfProfiles: OnvifUtil.nullableIntMappedFromXml(
    json['MaximumNumberOfProfiles'] as Map<String, dynamic>?,
  ),
  boundsRange: IntRectangleRange.fromJson(
    json['BoundsRange'] as Map<String, dynamic>,
  ),
  videoSourceTokensAvailable: OnvifUtil.stringMappedFromXmlList(
    json['VideoSourceTokensAvailable'] as Map<String, dynamic>,
  ),
  extension: json['Extension'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$VideoSourceConfigurationOptionsToJson(
  VideoSourceConfigurationOptions instance,
) => <String, dynamic>{
  'MaximumNumberOfProfiles': instance.maximumNumberOfProfiles,
  'BoundsRange': instance.boundsRange,
  'VideoSourceTokensAvailable': instance.videoSourceTokensAvailable,
  'Extension': instance.extension,
};
