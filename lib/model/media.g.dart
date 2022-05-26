// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Media _$MediaFromJson(Map<String, dynamic> json) => Media(
      xaddr: OnvifUtil.mappedToString(json['XAddr'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MediaToJson(Media instance) => <String, dynamic>{
      'XAddr': instance.xaddr,
    };
