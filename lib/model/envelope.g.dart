// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'envelope.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Envelope _$EnvelopeFromJson(Map<String, dynamic> json) {
  return Envelope(
    body: Body.fromJson(json['Body'] as Map<String, dynamic>),
    header: json['Header'] == null
        ? null
        : Header.fromJson(json['Header'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EnvelopeToJson(Envelope instance) => <String, dynamic>{
      'Body': instance.body.toJson(),
      'Header': instance.header?.toJson(),
    };
