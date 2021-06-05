// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'systemUrisResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSystemUrisResponse _$GetSystemUrisResponseFromJson(
    Map<String, dynamic> json) {
  return GetSystemUrisResponse(
    systemLogUris:
        SystemLogUris.fromJson(json['SystemLogUris'] as Map<String, dynamic>),
    supportInfoUri: json['SupportInfoUri'],
    systemBackupUri: json['SystemBackupUri'],
  );
}

Map<String, dynamic> _$GetSystemUrisResponseToJson(
        GetSystemUrisResponse instance) =>
    <String, dynamic>{
      'SystemLogUris': instance.systemLogUris.toJson(),
      'SupportInfoUri': instance.supportInfoUri,
      'SystemBackupUri': instance.systemBackupUri,
    };
