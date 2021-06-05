// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appSequence.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppSequence _$AppSequenceFromJson(Map<String, dynamic> json) {
  return AppSequence(
    json['@MessageNumber'],
    json['@InstanceId'],
  );
}

Map<String, dynamic> _$AppSequenceToJson(AppSequence instance) =>
    <String, dynamic>{
      '@MessageNumber': instance.xmlMessageNumber,
      '@InstanceId': instance.xmlInstanceId,
    };
