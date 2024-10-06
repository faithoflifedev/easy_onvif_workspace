// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_snapshot_uri_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSnapshotUriResponse _$GetSnapshotUriResponseFromJson(
        Map<String, dynamic> json) =>
    GetSnapshotUriResponse(
      uri: OnvifUtil.mappedToString(json['Uri'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetSnapshotUriResponseToJson(
        GetSnapshotUriResponse instance) =>
    <String, dynamic>{
      'Uri': instance.uri,
    };
