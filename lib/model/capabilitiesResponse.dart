import 'package:json_annotation/json_annotation.dart';

import 'capabilities.dart';

part 'capabilitiesResponse.g.dart';

@JsonSerializable(explicitToJson: true)
class GetCapabilitiesResponse {
  @JsonKey(name: 'Capabilities')
  final Capabilities capabilities;

  GetCapabilitiesResponse(this.capabilities);

  factory GetCapabilitiesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCapabilitiesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetCapabilitiesResponseToJson(this);
}
