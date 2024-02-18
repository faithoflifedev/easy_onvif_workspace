// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ptz_move_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PtzMoveStatus _$PtzMoveStatusFromJson(Map<String, dynamic> json) =>
    PtzMoveStatus(
      panTilt: $enumDecodeNullable(_$MoveStatusEnumMap, json['PanTilt']),
      zoom: $enumDecodeNullable(_$MoveStatusEnumMap, json['Zoom']),
    );

Map<String, dynamic> _$PtzMoveStatusToJson(PtzMoveStatus instance) =>
    <String, dynamic>{
      'PanTilt': _$MoveStatusEnumMap[instance.panTilt],
      'Zoom': _$MoveStatusEnumMap[instance.zoom],
    };

const _$MoveStatusEnumMap = {
  MoveStatus.auto: 'auto',
  MoveStatus.manual: 'manual',
  MoveStatus.unknown: 'unknown',
};
