import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_snapshot_uri_response.g.dart';

/// A client uses the GetSnapshotUri command to obtain a JPEG snapshot from the
/// device. The returned URI shall remain valid indefinitely even if the profile
/// is changed. The ValidUntilConnect, ValidUntilReboot and Timeout Parameter
/// shall be set accordingly (ValidUntilConnect=false, ValidUntilReboot=false,
/// timeout=PT0S). The URI can be used for acquiring a JPEG image through a HTTP
/// GET operation. The image encoding will always be JPEG regardless of the
/// encoding setting in the media profile. The Jpeg settings (like resolution or
/// quality) may be taken from the profile if suitable. The provided image will
/// be updated automatically and independent from calls to GetSnapshotUri.
@JsonSerializable()
class GetSnapshotUriResponse {
  @JsonKey(name: 'Uri', fromJson: OnvifUtil.stringMappedFromXml)
  final String uri;

  GetSnapshotUriResponse({required this.uri});

  factory GetSnapshotUriResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSnapshotUriResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetSnapshotUriResponseToJson(this);

  @override
  String toString() => json.encode(toJson());
}
