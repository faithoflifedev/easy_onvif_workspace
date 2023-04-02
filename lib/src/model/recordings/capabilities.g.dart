// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'capabilities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Capabilities _$CapabilitiesFromJson(Map<String, dynamic> json) => Capabilities(
      dynamicRecordings:
          OnvifUtil.stringToBool(json['@DynamicRecordings'] as String),
      dynamicTracks: OnvifUtil.stringToBool(json['@DynamicTracks'] as String),
      encoding: OnvifUtil.stringToList(json['@Encoding'] as String),
      maxRate: int.parse(json['@MaxRate'] as String),
      maxTotalRate: int.parse(json['@MaxTotalRate'] as String),
      maxRecordings: int.parse(json['@MaxRecordings'] as String),
      maxRecordingJobs: int.parse(json['@MaxRecordingJobs'] as String),
      options: OnvifUtil.stringToBool(json['@Options'] as String),
      metadataRecording:
          OnvifUtil.nullableStringToBool(json['@MetadataRecording'] as String?),
      supportedExportFileFormats: OnvifUtil.nullableStringToBool(
          json['@SupportedExportFileFormats'] as String?),
      eventRecording:
          OnvifUtil.nullableStringToBool(json['@EventRecording'] as String?),
      beforeEventLimit: json['@BeforeEventLimit'] as String?,
      afterEventLimit: json['@AfterEventLimit'] as String?,
    );

Map<String, dynamic> _$CapabilitiesToJson(Capabilities instance) =>
    <String, dynamic>{
      '@DynamicRecordings': instance.dynamicRecordings,
      '@DynamicTracks': instance.dynamicTracks,
      '@Encoding': instance.encoding,
      '@MaxRate': instance.maxRate,
      '@MaxTotalRate': instance.maxTotalRate,
      '@MaxRecordings': instance.maxRecordings,
      '@MaxRecordingJobs': instance.maxRecordingJobs,
      '@Options': instance.options,
      '@MetadataRecording': instance.metadataRecording,
      '@SupportedExportFileFormats': instance.supportedExportFileFormats,
      '@EventRecording': instance.eventRecording,
      '@BeforeEventLimit': instance.beforeEventLimit,
      '@AfterEventLimit': instance.afterEventLimit,
    };
