import 'package:json_annotation/json_annotation.dart';

import 'systemDateAndTime.dart';

part 'systemDateTimeResponse.g.dart';

@JsonSerializable(explicitToJson: true)
class GetSystemDateAndTimeResponse {
  @JsonKey(name: 'SystemDateAndTime')
  final SystemDateAndTime systemDateAndTime;

  GetSystemDateAndTimeResponse(this.systemDateAndTime);

  factory GetSystemDateAndTimeResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSystemDateAndTimeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetSystemDateAndTimeResponseToJson(this);
}
