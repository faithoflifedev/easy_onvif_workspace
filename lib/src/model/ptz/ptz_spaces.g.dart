// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ptz_spaces.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PtzSpaces _$PtzSpacesFromJson(Map<String, dynamic> json) => PtzSpaces(
      absolutePanTiltPositionSpace:
          PtzSpaces._unboundSpace2D(json['AbsolutePanTiltPositionSpace']),
      absoluteZoomPositionSpace:
          PtzSpaces._unboundSpace1D(json['AbsoluteZoomPositionSpace']),
      relativePanTiltTranslationSpace:
          PtzSpaces._unboundSpace2D(json['RelativePanTiltTranslationSpace']),
      relativeZoomTranslationSpace:
          PtzSpaces._unboundSpace1D(json['RelativeZoomTranslationSpace']),
      continuousPanTiltVelocitySpace:
          PtzSpaces._unboundSpace2D(json['ContinuousPanTiltVelocitySpace']),
      continuousZoomVelocitySpace:
          PtzSpaces._unboundSpace1D(json['ContinuousZoomVelocitySpace']),
      panTiltSpeedSpace: PtzSpaces._unboundSpace1D(json['PanTiltSpeedSpace']),
      zoomSpeedSpace: PtzSpaces._unboundSpace1D(json['ZoomSpeedSpace']),
      extension: json['Extension'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$PtzSpacesToJson(PtzSpaces instance) => <String, dynamic>{
      'AbsolutePanTiltPositionSpace': instance.absolutePanTiltPositionSpace,
      'AbsoluteZoomPositionSpace': instance.absoluteZoomPositionSpace,
      'RelativePanTiltTranslationSpace':
          instance.relativePanTiltTranslationSpace,
      'RelativeZoomTranslationSpace': instance.relativeZoomTranslationSpace,
      'ContinuousPanTiltVelocitySpace': instance.continuousPanTiltVelocitySpace,
      'ContinuousZoomVelocitySpace': instance.continuousZoomVelocitySpace,
      'PanTiltSpeedSpace': instance.panTiltSpeedSpace,
      'ZoomSpeedSpace': instance.zoomSpeedSpace,
      'Extension': instance.extension,
    };
