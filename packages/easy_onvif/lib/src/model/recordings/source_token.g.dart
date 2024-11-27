// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SourceToken _$SourceTokenFromJson(Map<String, dynamic> json) => SourceToken(
      type: json['@Type'] as String?,
      token: OnvifUtil.mappedToString(json['Token']),
    );

Map<String, dynamic> _$SourceTokenToJson(SourceToken instance) =>
    <String, dynamic>{
      '@Type': instance.type,
      'Token': instance.token,
    };
