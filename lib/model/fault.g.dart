// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fault.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Fault _$FaultFromJson(Map<String, dynamic> json) => Fault(
      code: Code.fromJson(json['Code'] as Map<String, dynamic>),
      reason: json['Reason'] == null
          ? null
          : Reason.fromJson(json['Reason'] as Map<String, dynamic>),
      xmlNode: json['Node'],
      xmlRole: json['Role'],
      detail: json['Detail'] == null
          ? null
          : Detail.fromJson(json['Detail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FaultToJson(Fault instance) => <String, dynamic>{
      'Code': instance.code.toJson(),
      'Reason': instance.reason?.toJson(),
      'Node': instance.xmlNode,
      'Role': instance.xmlRole,
      'Detail': instance.detail?.toJson(),
    };
