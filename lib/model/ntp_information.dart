import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'ntp.dart';

part 'ntp_information.g.dart';

@JsonSerializable(explicitToJson: true)
class NtpInformation {
  @JsonKey(name: 'FromDHCP')
  final String xmlFromDhcp;

  @JsonKey(name: 'NTPManual', fromJson: _ntpConverter)
  final List<Ntp>? ntpManual;

  @JsonKey(name: 'NTPFromDHCP', fromJson: _ntpConverter)
  final List<Ntp>? ntpFromDhcp;

  bool get fromDHCP => xmlFromDhcp.toLowerCase() == 'true';

  NtpInformation({required this.xmlFromDhcp, this.ntpManual, this.ntpFromDhcp});

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
}
