// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'header.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Header _$HeaderFromJson(Map<String, dynamic> json) => Header(
      appSequence: json['AppSequence'] == null
          ? null
          : AppSequence.fromJson(json['AppSequence'] as Map<String, dynamic>),
      xmlMessageID: json['MessageID'],
      xmlRelatesTo: json['RelatesTo'],
      xmlTo: json['To'],
      xmlAction: json['Action'],
    );

Map<String, dynamic> _$HeaderToJson(Header instance) => <String, dynamic>{
      'AppSequence': instance.appSequence?.toJson(),
      'MessageID': instance.xmlMessageID,
      'RelatesTo': instance.xmlRelatesTo,
      'To': instance.xmlTo,
      'Action': instance.xmlAction,
    };
