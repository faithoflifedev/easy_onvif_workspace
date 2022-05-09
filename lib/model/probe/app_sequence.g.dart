// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_sequence.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppSequence _$AppSequenceFromJson(Map<String, dynamic> json) => AppSequence(
      json['@MessageNumber'],
      json['@InstanceId'],
    );

Map<String, dynamic> _$AppSequenceToJson(AppSequence instance) =>
    <String, dynamic>{
      '@MessageNumber': instance.xmlMessageNumber,
      '@InstanceId': instance.xmlInstanceId,
    };
