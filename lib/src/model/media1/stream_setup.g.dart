// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stream_setup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StreamSetup _$StreamSetupFromJson(Map<String, dynamic> json) => StreamSetup(
      stream: json['Stream'] as String,
      transport: Transport.fromJson(json['Transport'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StreamSetupToJson(StreamSetup instance) =>
    <String, dynamic>{
      'Stream': instance.stream,
      'Transport': instance.transport,
    };
