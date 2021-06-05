import 'package:json_annotation/json_annotation.dart';

import 'service.dart';

part 'servicesResponse.g.dart';

@JsonSerializable(explicitToJson: true)
class GetServicesResponse {
  @JsonKey(name: 'Services')
  final List<Service> services;

  GetServicesResponse(this.services);

  factory GetServicesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetServicesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetServicesResponseToJson(this);
}
