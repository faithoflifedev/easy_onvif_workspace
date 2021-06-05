import 'package:json_annotation/json_annotation.dart';

import 'mediaUri.dart';

part 'uriResponse.g.dart';

@JsonSerializable(explicitToJson: true)
class GetUriResponse {
  @JsonKey(name: 'MediaUri')
  final MediaUri mediaUri;

  GetUriResponse({required this.mediaUri});

  factory GetUriResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUriResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetUriResponseToJson(this);
}
