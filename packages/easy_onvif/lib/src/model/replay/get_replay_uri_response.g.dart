// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_replay_uri_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetReplayUriResponse _$GetReplayUriResponseFromJson(
        Map<String, dynamic> json) =>
    GetReplayUriResponse(
      uri: OnvifUtil.mappedToString(json['Uri']),
    );

Map<String, dynamic> _$GetReplayUriResponseToJson(
        GetReplayUriResponse instance) =>
    <String, dynamic>{
      'Uri': instance.uri,
    };
