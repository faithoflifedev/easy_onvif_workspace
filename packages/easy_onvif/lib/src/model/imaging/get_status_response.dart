import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'imaging_status_20.dart';

part 'get_status_response.g.dart';

/// Via this command the current status of the Move operation can be requested.
/// Supported for this command is available if the support for the Move
/// operation is signalled via GetMoveOptions.
@JsonSerializable()
class GetStatusResponse {
  /// Requested imaging status.
  @JsonKey(name: 'Status')
  final ImagingStatus20 imagingStatus20;

  GetStatusResponse({required this.imagingStatus20});

  factory GetStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$GetStatusResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetStatusResponseToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
