import 'package:json_annotation/json_annotation.dart';

part 'get_endpoint_reference_response.g.dart';

/// A client can ask for the device service endpoint reference address property
/// that can be used to derive the password equivalent for remote user
/// operation. The device shall support the GetEndpointReference command
/// returning the address property of the device service endpoint reference.
@JsonSerializable()
class GetEndpointReferenceResponse {
  @JsonKey(name: 'GUID')
  final Map<String, dynamic> guid;

  GetEndpointReferenceResponse({required this.guid});

  factory GetEndpointReferenceResponse.fromJson(Map<String, dynamic> json) =>
      _$GetEndpointReferenceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetEndpointReferenceResponseToJson(this);
}
