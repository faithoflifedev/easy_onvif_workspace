// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Info _$InfoFromJson(Map<String, dynamic> json) => Info(
      codec: Info._unbound(json['Codec']),
      total: OnvifUtil.mappedToInt(json['Total'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InfoToJson(Info instance) => <String, dynamic>{
      'Codec': instance.codec,
      'Total': instance.total,
    };
