import 'package:json_annotation/json_annotation.dart';

import 'ptzStatus.dart';

part 'statusResponse.g.dart';

@JsonSerializable(explicitToJson: true)
class GetStatusResponse {
  @JsonKey(name: 'PTZStatus')
  PtzStatus ptzStatus;

  GetStatusResponse({
    required this.ptzStatus,
  });

  factory GetStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$GetStatusResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetStatusResponseToJson(this);
}
