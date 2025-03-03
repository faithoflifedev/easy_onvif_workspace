// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_system_log_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSystemLogResponse _$GetSystemLogResponseFromJson(
  Map<String, dynamic> json,
) => GetSystemLogResponse(
  systemLog: SystemInformation.fromJson(
    json['SystemLog'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$GetSystemLogResponseToJson(
  GetSystemLogResponse instance,
) => <String, dynamic>{'SystemLog': instance.systemLog};
