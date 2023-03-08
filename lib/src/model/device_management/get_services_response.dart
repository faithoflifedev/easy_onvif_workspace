import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'service.dart';

part 'get_services_response.g.dart';

@JsonSerializable()
class GetServicesResponse {
  @JsonKey(name: 'Service', fromJson: _unbound)
  final List<Service> services;

  GetServicesResponse(this.services);

  factory GetServicesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetServicesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetServicesResponseToJson(this);

  @override
  String toString() => json.encode(toJson());

  static List<Service> _unbound(dynamic json) {
    if (json is List) {
      return json
          .map((e) => Service.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    return [Service.fromJson(json as Map<String, dynamic>)];
  }
}
