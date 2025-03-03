// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recording_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecordingSummary _$RecordingSummaryFromJson(Map<String, dynamic> json) =>
    RecordingSummary(
      dataFrom: OnvifUtil.nullableMappedStdToDateTime(
        json['DataFrom'] as Map<String, dynamic>?,
      ),
      dataUntil: OnvifUtil.nullableMappedStdToDateTime(
        json['DataUntil'] as Map<String, dynamic>?,
      ),
      numberRecordings: OnvifUtil.intMappedFromXml(
        json['NumberRecordings'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$RecordingSummaryToJson(RecordingSummary instance) =>
    <String, dynamic>{
      'DataFrom': instance.dataFrom?.toIso8601String(),
      'DataUntil': instance.dataUntil?.toIso8601String(),
      'NumberRecordings': instance.numberRecordings,
    };
