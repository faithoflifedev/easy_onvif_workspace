// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_tracks_response_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTracksResponseItem _$GetTracksResponseItemFromJson(
        Map<String, dynamic> json) =>
    GetTracksResponseItem(
      trackToken:
          OnvifUtil.mappedToString(json['TrackToken'] as Map<String, dynamic>),
      configuration: TrackConfiguration.fromJson(
          json['Configuration'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetTracksResponseItemToJson(
        GetTracksResponseItem instance) =>
    <String, dynamic>{
      'TrackToken': instance.trackToken,
      'Configuration': instance.configuration,
    };
