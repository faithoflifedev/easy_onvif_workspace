// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoveStatus _$MoveStatusFromJson(Map<String, dynamic> json) => MoveStatus(
  panTilt: OnvifUtil.nullableStringMappedFromXml(
    json['PanTilt'] as Map<String, dynamic>?,
  ),
  zoom: OnvifUtil.nullableStringMappedFromXml(
    json['Zoom'] as Map<String, dynamic>?,
  ),
);

Map<String, dynamic> _$MoveStatusToJson(MoveStatus instance) =>
    <String, dynamic>{'PanTilt': instance.panTilt, 'Zoom': instance.zoom};
