// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ptzPosition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PtzPosition _$PtzPositionFromJson(Map<String, dynamic> json) {
  return PtzPosition(
    panTilt: json['PanTilt'] == null
        ? null
        : PanTilt.fromJson(json['PanTilt'] as Map<String, dynamic>),
    zoom: json['Zoom'] == null
        ? null
        : Zoom.fromJson(json['Zoom'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PtzPositionToJson(PtzPosition instance) =>
    <String, dynamic>{
      'PanTilt': instance.panTilt,
      'Zoom': instance.zoom,
    };
