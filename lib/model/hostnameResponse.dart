import 'package:json_annotation/json_annotation.dart';

import 'hostnameInformation.dart';

part 'hostnameResponse.g.dart';

@JsonSerializable(explicitToJson: true)
class GetHostnameResponse {
  @JsonKey(name: 'HostnameInformation')
  HostnameInformation hostnameInformation;

  GetHostnameResponse({
    required this.hostnameInformation,
  });

  factory GetHostnameResponse.fromJson(Map<String, dynamic> json) =>
      _$GetHostnameResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetHostnameResponseToJson(this);
}
