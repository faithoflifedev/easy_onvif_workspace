// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fault.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Fault _$FaultFromJson(Map<String, dynamic> json) => Fault(
      Code.fromJson(json['Code'] as Map<String, dynamic>),
      Reason.fromJson(json['Reason'] as Map<String, dynamic>),
      json['Node'],
      json['Role'],
      Detail.fromJson(json['Detail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FaultToJson(Fault instance) => <String, dynamic>{
      'Code': instance.code.toJson(),
      'Reason': instance.reason.toJson(),
      'Node': instance.xmlNode,
      'Role': instance.xmlRole,
      'Detail': instance.detail.toJson(),
    };
