// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_device_information_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDeviceInformationResponse _$GetDeviceInformationResponseFromJson(
        Map<String, dynamic> json) =>
    GetDeviceInformationResponse(
      OnvifUtil.mappedToString(json['Manufacturer'] as Map<String, dynamic>),
      OnvifUtil.mappedToString(json['Model'] as Map<String, dynamic>),
      OnvifUtil.mappedToString(json['FirmwareVersion'] as Map<String, dynamic>),
      OnvifUtil.mappedToString(json['SerialNumber'] as Map<String, dynamic>),
      OnvifUtil.mappedToString(json['HardwareId'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetDeviceInformationResponseToJson(
        GetDeviceInformationResponse instance) =>
    <String, dynamic>{
      'Manufacturer': instance.manufacturer,
      'Model': instance.model,
      'FirmwareVersion': instance.firmwareVersion,
      'SerialNumber': instance.serialNumber,
      'HardwareId': instance.hardwareId,
    };
