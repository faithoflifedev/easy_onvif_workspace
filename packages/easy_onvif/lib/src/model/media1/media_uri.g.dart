// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_uri.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaUri _$MediaUriFromJson(Map<String, dynamic> json) => MediaUri(
  uri: OnvifUtil.stringMappedFromXml(json['Uri'] as Map<String, dynamic>),
  invalidAfterConnect: OnvifUtil.boolMappedFromXml(
    json['InvalidAfterConnect'] as Map<String, dynamic>,
  ),
  invalidAfterReboot: OnvifUtil.boolMappedFromXml(
    json['InvalidAfterReboot'] as Map<String, dynamic>,
  ),
  timeout: OnvifUtil.stringMappedFromXml(
    json['Timeout'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$MediaUriToJson(MediaUri instance) => <String, dynamic>{
  'Uri': instance.uri,
  'InvalidAfterConnect': instance.invalidAfterConnect,
  'InvalidAfterReboot': instance.invalidAfterReboot,
  'Timeout': instance.timeout,
};
