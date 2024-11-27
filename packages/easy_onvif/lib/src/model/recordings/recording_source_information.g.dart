// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recording_source_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecordingSourceInformation _$RecordingSourceInformationFromJson(
        Map<String, dynamic> json) =>
    RecordingSourceInformation(
      sourceId: OnvifUtil.mappedToString(json['SourceId']),
      name: OnvifUtil.mappedToString(json['Name']),
      location: OnvifUtil.mappedToString(json['Location']),
      description: OnvifUtil.mappedToString(json['Description']),
      address: OnvifUtil.mappedToString(json['Address']),
    );

Map<String, dynamic> _$RecordingSourceInformationToJson(
        RecordingSourceInformation instance) =>
    <String, dynamic>{
      'SourceId': instance.sourceId,
      'Name': instance.name,
      'Location': instance.location,
      'Description': instance.description,
      'Address': instance.address,
    };
