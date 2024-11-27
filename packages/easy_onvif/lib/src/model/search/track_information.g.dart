// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackInformation _$TrackInformationFromJson(Map<String, dynamic> json) =>
    TrackInformation(
      trackToken: OnvifUtil.mappedToString(json['TrackToken']),
      trackType: TrackInformation._trackType(json['TrackType']),
      description: OnvifUtil.mappedToString(json['Description']),
      dataFrom: OnvifUtil.mappedToStdDateTime(
          json['DataFrom'] as Map<String, dynamic>),
      dataTo:
          OnvifUtil.mappedToStdDateTime(json['DataTo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TrackInformationToJson(TrackInformation instance) =>
    <String, dynamic>{
      'TrackToken': instance.trackToken,
      'TrackType': _$TrackTypeEnumMap[instance.trackType]!,
      'Description': instance.description,
      'DataFrom': instance.dataFrom.toIso8601String(),
      'DataTo': instance.dataTo.toIso8601String(),
    };

const _$TrackTypeEnumMap = {
  TrackType.video: 'Video',
  TrackType.audio: 'Audio',
  TrackType.metadata: 'Metadata',
  TrackType.extended: 'Extended',
};
