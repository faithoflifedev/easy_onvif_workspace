// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Code _$CodeFromJson(Map<String, dynamic> json) {
  return Code(
    json['Value'],
    Code.fromJson(json['Subcode'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CodeToJson(Code instance) => <String, dynamic>{
      'Value': instance.xmlValue,
      'Subcode': instance.code.toJson(),
    };
