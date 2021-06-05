import 'package:json_annotation/json_annotation.dart';

part 'endpointReference.g.dart';

@JsonSerializable()
class EndpointReference {
  @JsonKey(name: 'Address')
  final dynamic xmlAddress;

  String get address => xmlAddress['\$'];

  EndpointReference(this.xmlAddress);

  factory EndpointReference.fromJson(Map<String, dynamic> json) =>
      _$EndpointReferenceFromJson(json);

  Map<String, dynamic> toJson() => _$EndpointReferenceToJson(this);
}
