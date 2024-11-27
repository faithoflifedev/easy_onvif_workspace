// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_device_information_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDeviceInformationResponse _$GetDeviceInformationResponseFromJson(
        Map<String, dynamic> json) =>
    GetDeviceInformationResponse(
      OnvifUtil.nullableMappedToString(
          json['Manufacturer'] as Map<String, dynamic>?),
      OnvifUtil.nullableMappedToString(json['Model'] as Map<String, dynamic>?),
      OnvifUtil.mappedToString(json['FirmwareVersion']),
      OnvifUtil.mappedToString(json['SerialNumber']),
      OnvifUtil.mappedToString(json['HardwareId']),
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
