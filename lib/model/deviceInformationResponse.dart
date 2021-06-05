import 'package:json_annotation/json_annotation.dart';

part 'deviceInformationResponse.g.dart';

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

  String get manufacturer => xmlManufacturer['\$'];
  String get model => xmlModel['\$'];
  String get firmwareVersion => xmlFirmwareVersion['\$'];
  String get serialNumber => xmlSerialNumber['\$'];
  String get hardwareId => xmlHardwareId['\$'];

  GetDeviceInformationResponse(this.xmlManufacturer, this.xmlModel,
      this.xmlFirmwareVersion, this.xmlSerialNumber, this.xmlHardwareId);

  factory GetDeviceInformationResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDeviceInformationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetDeviceInformationResponseToJson(this);
}
