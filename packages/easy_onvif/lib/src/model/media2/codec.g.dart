// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'codec.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Codec _$CodecFromJson(Map<String, dynamic> json) => Codec(
      encoding: OnvifUtil.stringMappedFromXml(
          json['Encoding'] as Map<String, dynamic>),
      number:
          OnvifUtil.intMappedFromXml(json['Number'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CodecToJson(Codec instance) => <String, dynamic>{
      'Encoding': instance.encoding,
      'Number': instance.number,
    };
