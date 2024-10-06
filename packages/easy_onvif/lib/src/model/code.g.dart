// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Code _$CodeFromJson(Map<String, dynamic> json) => Code(
      value: OnvifUtil.nullableMappedToString(
          json['Value'] as Map<String, dynamic>?),
      subCode: json['Subcode'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$CodeToJson(Code instance) => <String, dynamic>{
      'Value': instance.value,
      'Subcode': instance.subCode,
    };
