import 'package:json_annotation/json_annotation.dart';

import 'ntp.dart';

part 'ntpInformation.g.dart';

@JsonSerializable(explicitToJson: true)
class NtpInformation {
  @JsonKey(name: 'FromDHCP')
  final String xmlFromDhcp;

  @JsonKey(name: 'NTPManual')
  final Ntp? ntpManual;

  @JsonKey(name: 'NTPFromDHCP')
  final Ntp? ntpFromDhcp;

  bool get fromDHCP => xmlFromDhcp.toLowerCase() == 'true';

  NtpInformation({required this.xmlFromDhcp, this.ntpManual, this.ntpFromDhcp});

  factory NtpInformation.fromJson(Map<String, dynamic> json) =>
      _$NtpInformationFromJson(json);

  Map<String, dynamic> toJson() => _$NtpInformationToJson(this);
}
