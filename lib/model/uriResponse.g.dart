// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uriResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUriResponse _$GetUriResponseFromJson(Map<String, dynamic> json) {
  return GetUriResponse(
    mediaUri: MediaUri.fromJson(json['MediaUri'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GetUriResponseToJson(GetUriResponse instance) =>
    <String, dynamic>{
      'MediaUri': instance.mediaUri.toJson(),
    };
