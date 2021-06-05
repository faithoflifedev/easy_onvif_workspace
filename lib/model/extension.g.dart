// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extension.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Extension _$ExtensionFromJson(Map<String, dynamic> json) {
  return Extension(
    AudioOutputConfiguration.fromJson(json['Name'] as Map<String, dynamic>),
    AudioDecoderConfiguration.fromJson(
        json['UseCount'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ExtensionToJson(Extension instance) => <String, dynamic>{
      'Name': instance.audioOutputConfiguration.toJson(),
      'UseCount': instance.audioDecoderConfiguration.toJson(),
    };
