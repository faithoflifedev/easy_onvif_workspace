import 'package:json_annotation/json_annotation.dart';

import 'ntp_information.dart';

part 'ntp_response.g.dart';

///NTP information.
@JsonSerializable(explicitToJson: true)
class GetNTPResponse {
  ///NTP information.
  @JsonKey(name: 'NTPInformation')
  NtpInformation ntpInformation;

  GetNTPResponse({
    required this.ntpInformation,
  });

  factory GetNTPResponse.fromJson(Map<String, dynamic> json) =>
      _$GetNTPResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetNTPResponseToJson(this);
}
