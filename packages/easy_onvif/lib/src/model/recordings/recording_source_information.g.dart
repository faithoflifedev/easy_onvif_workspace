// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recording_source_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecordingSourceInformation _$RecordingSourceInformationFromJson(
  Map<String, dynamic> json,
) => RecordingSourceInformation(
  sourceId: OnvifUtil.stringMappedFromXml(
    json['SourceId'] as Map<String, dynamic>,
  ),
  name: OnvifUtil.stringMappedFromXml(json['Name'] as Map<String, dynamic>),
  location: OnvifUtil.stringMappedFromXml(
    json['Location'] as Map<String, dynamic>,
  ),
  description: OnvifUtil.stringMappedFromXml(
    json['Description'] as Map<String, dynamic>,
  ),
  address: OnvifUtil.stringMappedFromXml(
    json['Address'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$RecordingSourceInformationToJson(
  RecordingSourceInformation instance,
) => <String, dynamic>{
  'SourceId': instance.sourceId,
  'Name': instance.name,
  'Location': instance.location,
  'Description': instance.description,
  'Address': instance.address,
};
