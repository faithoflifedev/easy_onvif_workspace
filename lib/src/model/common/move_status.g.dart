// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoveStatus _$MoveStatusFromJson(Map<String, dynamic> json) => MoveStatus(
      panTilt: OnvifUtil.nullableMappedToString(
          json['PanTilt'] as Map<String, dynamic>?),
      zoom: OnvifUtil.nullableMappedToString(
          json['Zoom'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$MoveStatusToJson(MoveStatus instance) =>
    <String, dynamic>{
      'PanTilt': instance.panTilt,
      'Zoom': instance.zoom,
    };
