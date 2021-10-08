// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mediaUri.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaUri _$MediaUriFromJson(Map<String, dynamic> json) => MediaUri(
      json['Uri'],
      json['InvalidAfterConnect'],
      json['InvalidAfterReboot'],
      json['Timeout'],
    );

Map<String, dynamic> _$MediaUriToJson(MediaUri instance) => <String, dynamic>{
      'Uri': instance.xmlUri,
      'InvalidAfterConnect': instance.xmlInvalidAfterConnect,
      'InvalidAfterReboot': instance.xmlInvalidAfterReboot,
      'Timeout': instance.xmltimeout,
    };
