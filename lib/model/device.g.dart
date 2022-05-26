// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Device _$DeviceFromJson(Map<String, dynamic> json) => Device(
      xAddr: OnvifUtil.mappedToString(json['XAddr'] as Map<String, dynamic>),
      system: System.fromJson(json['System'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DeviceToJson(Device instance) => <String, dynamic>{
      'XAddr': instance.xAddr,
      'System': instance.system.toJson(),
    };
