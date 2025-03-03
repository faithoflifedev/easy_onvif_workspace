// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_reboot_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SystemRebootResponse _$SystemRebootResponseFromJson(
  Map<String, dynamic> json,
) => SystemRebootResponse(
  message: OnvifUtil.stringMappedFromXml(
    json['Message'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$SystemRebootResponseToJson(
  SystemRebootResponse instance,
) => <String, dynamic>{'Message': instance.message};
