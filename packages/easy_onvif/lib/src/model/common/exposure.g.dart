// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exposure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exposure _$ExposureFromJson(Map<String, dynamic> json) => Exposure(
      mode: OnvifUtil.nullableStringMappedFromXml(
          json['Mode'] as Map<String, dynamic>?),
      priority: OnvifUtil.nullableStringMappedFromXml(
          json['Priority'] as Map<String, dynamic>?),
      window: Window.fromJson(json['Window'] as Map<String, dynamic>),
      minExposureTime: OnvifUtil.nullableDoubleMappedFromXml(
          json['MinExposureTime'] as Map<String, dynamic>?),
      maxExposureTime: OnvifUtil.nullableDoubleMappedFromXml(
          json['MaxExposureTime'] as Map<String, dynamic>?),
      minGain: OnvifUtil.nullableDoubleMappedFromXml(
          json['MinGain'] as Map<String, dynamic>?),
      maxGain: OnvifUtil.nullableDoubleMappedFromXml(
          json['MaxGain'] as Map<String, dynamic>?),
      minIris: OnvifUtil.nullableDoubleMappedFromXml(
          json['MinIris'] as Map<String, dynamic>?),
      maxIris: OnvifUtil.nullableDoubleMappedFromXml(
          json['MaxIris'] as Map<String, dynamic>?),
      exposureTime: OnvifUtil.nullableDoubleMappedFromXml(
          json['ExposureTime'] as Map<String, dynamic>?),
      gain: OnvifUtil.nullableDoubleMappedFromXml(
          json['Gain'] as Map<String, dynamic>?),
      iris: OnvifUtil.nullableDoubleMappedFromXml(
          json['Iris'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$ExposureToJson(Exposure instance) => <String, dynamic>{
      'Mode': instance.mode,
      'Priority': instance.priority,
      'Window': instance.window,
      'MinExposureTime': instance.minExposureTime,
      'MaxExposureTime': instance.maxExposureTime,
      'MinGain': instance.minGain,
      'MaxGain': instance.maxGain,
      'MinIris': instance.minIris,
      'MaxIris': instance.maxIris,
      'ExposureTime': instance.exposureTime,
      'Gain': instance.gain,
      'Iris': instance.iris,
    };
