// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_sequence.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppSequence _$AppSequenceFromJson(Map<String, dynamic> json) => AppSequence(
      messageNumber:
          OnvifUtil.mappedToInt(json['@MessageNumber'] as Map<String, dynamic>),
      instanceId:
          OnvifUtil.mappedToInt(json['@InstanceId'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AppSequenceToJson(AppSequence instance) =>
    <String, dynamic>{
      '@MessageNumber': instance.messageNumber,
      '@InstanceId': instance.instanceId,
    };
