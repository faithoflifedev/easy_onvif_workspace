// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vector_1d.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vector1D _$Vector1DFromJson(Map<String, dynamic> json) => Vector1D(
      x: double.parse(json['@x'] as String),
      space: $enumDecodeNullable(_$SpaceEnumMap, json['@space']),
    );

Map<String, dynamic> _$Vector1DToJson(Vector1D instance) => <String, dynamic>{
      '@x': OnvifUtil.asString(instance.x),
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
  Space.panTiltDigitalPositionSpace:
      'http://www.onvif.org/ver10/tptz/PanTiltSpaces/DigitalPositionSpace',
  Space.panTiltDigitalTranslationSpace:
      'http://www.onvif.org/ver10/tptz/PanTiltSpaces/DigitalTranslationSpace',
};
