// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'root.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Root _$RootFromJson(Map<String, dynamic> json) {
  return Root(
    Envelope.fromJson(json['Envelope'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RootToJson(Root instance) => <String, dynamic>{
      'Envelope': instance.envelope.toJson(),
    };
