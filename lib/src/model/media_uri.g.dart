// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_uri.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaUri _$MediaUriFromJson(Map<String, dynamic> json) => MediaUri(
      uri: OnvifUtil.mappedToString(json['Uri'] as Map<String, dynamic>),
      invalidAfterConnect: OnvifUtil.mappedToBool(
          json['InvalidAfterConnect'] as Map<String, dynamic>),
      invalidAfterReboot: OnvifUtil.mappedToBool(
          json['InvalidAfterReboot'] as Map<String, dynamic>),
      timeout:
          OnvifUtil.mappedToString(json['Timeout'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MediaUriToJson(MediaUri instance) => <String, dynamic>{
      'Uri': instance.uri,
      'InvalidAfterConnect': instance.invalidAfterConnect,
      'InvalidAfterReboot': instance.invalidAfterReboot,
      'Timeout': instance.timeout,
    };
