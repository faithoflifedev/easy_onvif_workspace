import 'package:json_annotation/json_annotation.dart';

import 'ntp_information.dart';

part 'get_ntp_response.g.dart';

///NTP information.
@JsonSerializable()
class GetNtpResponse {
  ///NTP information.
  @JsonKey(name: 'NTPInformation')
  NtpInformation ntpInformation;

  GetNtpResponse({required this.ntpInformation});

  factory GetNtpResponse.fromJson(Map<String, dynamic> json) =>
      _$GetNtpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetNtpResponseToJson(this);
}
