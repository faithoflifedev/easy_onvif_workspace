// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vector_2d.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vector2D _$Vector2DFromJson(Map<String, dynamic> json) => Vector2D(
      x: double.parse(json['@x'] as String),
      y: double.parse(json['@y'] as String),
      space: $enumDecodeNullable(_$SpaceEnumMap, json['@space']),
    );

Map<String, dynamic> _$Vector2DToJson(Vector2D instance) => <String, dynamic>{
      '@x': instance.x,
      '@y': instance.y,
      '@space': _$SpaceEnumMap[instance.space],
    };

const _$SpaceEnumMap = {
  Space.zoomPositionGenericSpace:
      'http://www.onvif.org/ver10/tptz/ZoomSpaces/PositionGenericSpace',
  Space.zoomTranslationGenericSpace:
      'http://www.onvif.org/ver10/tptz/ZoomSpaces/TranslationGenericSpace',
  Space.zoomVelocityGenericSpace:
      'http://www.onvif.org/ver10/tptz/ZoomSpaces/VelocityGenericSpace',
  Space.zoomGenericSpeedSpace:
      'http://www.onvif.org/ver10/tptz/ZoomSpaces/GenericSpeedSpace',
  Space.panTiltPositionGenericSpace:
      'http://www.onvif.org/ver10/tptz/PanTiltSpaces/PositionGenericSpace',
  Space.panTiltTranslationGenericSpace:
      'http://www.onvif.org/ver10/tptz/PanTiltSpaces/TranslationGenericSpace',
  Space.panTiltVelocityGenericSpace:
      'http://www.onvif.org/ver10/tptz/PanTiltSpaces/VelocityGenericSpace',
  Space.panTiltGenericSpeedSpace:
      'http://www.onvif.org/ver10/tptz/PanTiltSpaces/GenericSpeedSpace',
};
