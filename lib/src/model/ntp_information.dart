import 'dart:convert';

import 'package:easy_onvif/src/util/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'ntp.dart';

part 'ntp_information.g.dart';

///NTP information.
@JsonSerializable(explicitToJson: true)
class NtpInformation {
  ///Indicates if NTP information is to be retrieved by using DHCP.
  @JsonKey(name: 'FromDHCP', fromJson: OnvifUtil.mappedToBool)
  final bool fromDhcp;

  ///List of manually entered NTP addresses.
  @JsonKey(name: 'NTPManual', fromJson: _nullableNtpConverter)
  final List<Ntp>? ntpManual;

  ///List of NTP addresses retrieved by using DHCP.
  @JsonKey(name: 'NTPFromDHCP', fromJson: _nullableNtpConverter)
  final List<Ntp>? ntpFromDhcp;

  NtpInformation({required this.fromDhcp, this.ntpManual, this.ntpFromDhcp});

  factory NtpInformation.fromJson(Map<String, dynamic> json) =>
      _$NtpInformationFromJson(json);

  Map<String, dynamic> toJson() => _$NtpInformationToJson(this);

  @override
  String toString() => json.encode(toJson());

  static List<Ntp> _ntpConverter(dynamic json) {
    if (json is List) {
      return json.map((e) => Ntp.fromJson(e as Map<String, dynamic>)).toList();
    }

    return [Ntp.fromJson(json as Map<String, dynamic>)];
  }

  static List<Ntp>? _nullableNtpConverter(dynamic json) {
    if (json == null) return null;

    return _ntpConverter(json);
  }
}
