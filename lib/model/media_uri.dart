import 'package:easy_onvif/util/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'media_uri.g.dart';

@JsonSerializable()
class MediaUri {
  @JsonKey(name: 'Uri', fromJson: OnvifUtil.mappedToString)
  final String uri;

  @JsonKey(name: 'InvalidAfterConnect', fromJson: OnvifUtil.mappedToBool)
  final bool invalidAfterConnect;

  @JsonKey(name: 'InvalidAfterReboot', fromJson: OnvifUtil.mappedToBool)
  final bool invalidAfterReboot;

  @JsonKey(name: 'Timeout', fromJson: OnvifUtil.mappedToString)
  final String timeout;

  MediaUri(
      {required this.uri,
      required this.invalidAfterConnect,
      required this.invalidAfterReboot,
      required this.timeout});

  factory MediaUri.fromJson(Map<String, dynamic> json) =>
      _$MediaUriFromJson(json);

  Map<String, dynamic> toJson() => _$MediaUriToJson(this);
}
