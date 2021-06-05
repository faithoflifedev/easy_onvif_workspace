// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Time _$TimeFromJson(Map<String, dynamic> json) {
  return Time(
    json['Hour'],
    json['Minute'],
    json['Second'],
  );
}

Map<String, dynamic> _$TimeToJson(Time instance) => <String, dynamic>{
      'Hour': instance.xmlHour,
      'Minute': instance.xmlMinute,
      'Second': instance.xmlSecond,
    };
