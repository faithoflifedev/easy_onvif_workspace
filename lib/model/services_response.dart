import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'service.dart';

part 'services_response.g.dart';

@JsonSerializable(explicitToJson: true)
class GetServicesResponse {
  @JsonKey(name: 'Service', fromJson: _serviceConverter)
  final List<Service> services;

  GetServicesResponse(this.services);

  factory GetServicesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetServicesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetServicesResponseToJson(this);

  @override
  String toString() => json.encode(toJson());

  static List<Service> _serviceConverter(dynamic json) {
    if (json is List) {
      return json
          .map((e) => Service.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    return [Service.fromJson(json as Map<String, dynamic>)];
  }
}
