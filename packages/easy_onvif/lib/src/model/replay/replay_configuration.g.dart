// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'replay_configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReplayConfiguration _$ReplayConfigurationFromJson(Map<String, dynamic> json) =>
    ReplayConfiguration(
      sessionTimeout: OnvifUtil.mappedToString(json['SessionTimeout']),
    );

Map<String, dynamic> _$ReplayConfigurationToJson(
        ReplayConfiguration instance) =>
    <String, dynamic>{
      'SessionTimeout': instance.sessionTimeout,
    };
