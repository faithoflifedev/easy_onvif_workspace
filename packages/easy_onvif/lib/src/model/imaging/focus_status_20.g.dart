// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'focus_status_20.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FocusStatus20 _$FocusStatus20FromJson(Map<String, dynamic> json) =>
    FocusStatus20(
      position:
          OnvifUtil.mappedToDouble(json['Position'] as Map<String, dynamic>),
      moveStatus: OnvifUtil.mappedToString(json['MoveStatus']),
      error: OnvifUtil.nullableMappedToString(
          json['Error'] as Map<String, dynamic>?),
      extension: json['Extension'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$FocusStatus20ToJson(FocusStatus20 instance) =>
    <String, dynamic>{
      'Position': instance.position,
      'MoveStatus': instance.moveStatus,
      'Error': instance.error,
      'Extension': instance.extension,
    };
