// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'codec.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Codec _$CodecFromJson(Map<String, dynamic> json) => Codec(
      encoding: OnvifUtil.mappedToString(json['Encoding']),
      number: OnvifUtil.mappedToInt(json['Number'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CodecToJson(Codec instance) => <String, dynamic>{
      'Encoding': instance.encoding,
      'Number': instance.number,
    };
