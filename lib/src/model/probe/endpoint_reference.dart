import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'endpoint_reference.g.dart';

@JsonSerializable()
class EndpointReference {
  @JsonKey(name: 'Address', fromJson: OnvifUtil.mappedToString)
  final String address;

  EndpointReference({required this.address});

  factory EndpointReference.fromJson(Map<String, dynamic> json) =>
      _$EndpointReferenceFromJson(json);

  Map<String, dynamic> toJson() => _$EndpointReferenceToJson(this);

  @override
  String toString() => json.encode(toJson());
}
