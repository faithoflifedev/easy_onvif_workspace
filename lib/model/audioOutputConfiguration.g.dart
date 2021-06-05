// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audioOutputConfiguration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AudioOutputConfiguration _$AudioOutputConfigurationFromJson(
    Map<String, dynamic> json) {
  return AudioOutputConfiguration(
    json['@token'] as String,
    json['Name'],
    json['UseCount'],
    json['OutputToken'],
    json['SendPrimacy'],
    json['OutputLevel'],
  );
}

Map<String, dynamic> _$AudioOutputConfigurationToJson(
        AudioOutputConfiguration instance) =>
    <String, dynamic>{
      '@token': instance.token,
      'Name': instance.xmlName,
      'UseCount': instance.xmlUseCount,
      'OutputToken': instance.xmlOutputToken,
      'SendPrimacy': instance.xmlSendPrimacy,
      'OutputLevel': instance.xmlOutputLevel,
    };
