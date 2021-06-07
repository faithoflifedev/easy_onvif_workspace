import 'package:json_annotation/json_annotation.dart';

part 'deviceInformationResponse.g.dart';

///This operation gets basic device information from the device.
@JsonSerializable(explicitToJson: true)
class GetDeviceInformationResponse {
  @JsonKey(name: 'Manufacturer')
  final dynamic xmlManufacturer;

  @JsonKey(name: 'Model')
  final dynamic xmlModel;

  @JsonKey(name: 'FirmwareVersion')
  final dynamic xmlFirmwareVersion;

  @JsonKey(name: 'SerialNumber')
  final dynamic xmlSerialNumber;

  @JsonKey(name: 'HardwareId')
  final dynamic xmlHardwareId;

  ///The manufactor of the device.
  String get manufacturer => xmlManufacturer['\$'];

  ///The device model.
  String get model => xmlModel['\$'];

  ///The firmware version in the device.
  String get firmwareVersion => xmlFirmwareVersion['\$'];

  ///The serial number of the device.
  String get serialNumber => xmlSerialNumber['\$'];

  ///The hardware ID of the device.
  String get hardwareId => xmlHardwareId['\$'];

  GetDeviceInformationResponse(this.xmlManufacturer, this.xmlModel,
      this.xmlFirmwareVersion, this.xmlSerialNumber, this.xmlHardwareId);

  factory GetDeviceInformationResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDeviceInformationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetDeviceInformationResponseToJson(this);
}
