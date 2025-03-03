import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'service.dart';

part 'get_services_response.g.dart';

@JsonSerializable()
class GetServicesResponse {
  @JsonKey(name: 'Service', fromJson: _fromJson)
  final List<Service> services;

  GetServicesResponse(this.services);

  factory GetServicesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetServicesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetServicesResponseToJson(this);

  @override
  String toString() => json.encode(toJson());

  static List<Service> _fromJson(dynamic json) => OnvifUtil.jsonList<Service>(
    json,
    (json) => Service.fromJson(json as Map<String, dynamic>),
  );
}
