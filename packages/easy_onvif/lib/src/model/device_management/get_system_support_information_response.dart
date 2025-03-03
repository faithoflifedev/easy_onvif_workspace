import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'system_information.dart';

part 'get_system_support_information_response.g.dart';

/// This operation gets arbitrary device diagnostics information from the device.
@JsonSerializable()
class GetSystemSupportInformationResponse {
  /// Contains the arbitrary device diagnostics information.
  @JsonKey(name: 'SupportInformation')
  final SystemInformation supportInformation;

  GetSystemSupportInformationResponse({required this.supportInformation});

  factory GetSystemSupportInformationResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$GetSystemSupportInformationResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetSystemSupportInformationResponseToJson(this);

  @override
  String toString() => json.encode(toJson());
}
