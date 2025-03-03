import 'package:easy_onvif/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_status_response.g.dart';

@JsonSerializable()
class GetStatusResponse {
  @JsonKey(name: 'PTZStatus')
  PtzStatus ptzStatus;

  GetStatusResponse({required this.ptzStatus});

  factory GetStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$GetStatusResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetStatusResponseToJson(this);
}
