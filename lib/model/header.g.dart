// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'header.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Header _$HeaderFromJson(Map<String, dynamic> json) => Header(
      AppSequence.fromJson(json['AppSequence'] as Map<String, dynamic>),
      json['MessageID'],
      json['RelatesTo'],
      json['To'],
      json['Action'],
    );

Map<String, dynamic> _$HeaderToJson(Header instance) => <String, dynamic>{
      'AppSequence': instance.appSequence.toJson(),
      'MessageID': instance.xmlMessageID,
      'RelatesTo': instance.xmlRelatesTo,
      'To': instance.xmlTo,
      'Action': instance.xmlAction,
    };
