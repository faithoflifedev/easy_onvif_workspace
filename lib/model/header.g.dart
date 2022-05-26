// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'header.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Header _$HeaderFromJson(Map<String, dynamic> json) => Header(
      appSequence: json['AppSequence'] == null
          ? null
          : AppSequence.fromJson(json['AppSequence'] as Map<String, dynamic>),
      messageID:
          OnvifUtil.mappedToInt(json['MessageID'] as Map<String, dynamic>),
      relatesTo:
          OnvifUtil.mappedToString(json['RelatesTo'] as Map<String, dynamic>),
      to: OnvifUtil.mappedToString(json['To'] as Map<String, dynamic>),
      action: OnvifUtil.mappedToString(json['Action'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HeaderToJson(Header instance) => <String, dynamic>{
      'AppSequence': instance.appSequence?.toJson(),
      'MessageID': instance.messageID,
      'RelatesTo': instance.relatesTo,
      'To': instance.to,
      'Action': instance.action,
    };
