// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_sequence.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppSequence _$AppSequenceFromJson(Map<String, dynamic> json) => AppSequence(
  messageNumber: int.parse(json['@MessageNumber'] as String),
  instanceId: int.parse(json['@InstanceId'] as String),
);

Map<String, dynamic> _$AppSequenceToJson(AppSequence instance) =>
    <String, dynamic>{
      '@MessageNumber': instance.messageNumber,
      '@InstanceId': instance.instanceId,
    };
