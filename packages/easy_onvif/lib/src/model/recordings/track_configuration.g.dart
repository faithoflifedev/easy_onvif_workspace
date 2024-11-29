// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackConfiguration _$TrackConfigurationFromJson(Map<String, dynamic> json) =>
    TrackConfiguration(
      trackType: TrackConfiguration._trackType(json['TrackType']),
      description: OnvifUtil.stringMappedFromXml(
          json['Description'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TrackConfigurationToJson(TrackConfiguration instance) =>
    <String, dynamic>{
      'TrackType': _$TrackTypeEnumMap[instance.trackType]!,
      'Description': instance.description,
    };

const _$TrackTypeEnumMap = {
  TrackType.video: 'Video',
  TrackType.audio: 'Audio',
  TrackType.metadata: 'Metadata',
  TrackType.extended: 'Extended',
};
