// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Time _$TimeFromJson(Map<String, dynamic> json) => Time(
      hour: OnvifUtil.mappedToInt(json['Hour'] as Map<String, dynamic>),
      minute: OnvifUtil.mappedToInt(json['Minute'] as Map<String, dynamic>),
      second: OnvifUtil.mappedToInt(json['Second'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TimeToJson(Time instance) => <String, dynamic>{
      'Hour': instance.hour,
      'Minute': instance.minute,
      'Second': instance.second,
    };
