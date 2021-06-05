// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'h264.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

H264 _$H264FromJson(Map<String, dynamic> json) {
  return H264(
    json['GovLength'],
    json['H264Profile'],
  );
}

Map<String, dynamic> _$H264ToJson(H264 instance) => <String, dynamic>{
      'GovLength': instance.xmlGovLength,
      'H264Profile': instance.xmlH264Profile,
    };
