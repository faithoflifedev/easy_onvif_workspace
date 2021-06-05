import 'package:json_annotation/json_annotation.dart';

part 'mediaUri.g.dart';

@JsonSerializable()
class MediaUri {
  @JsonKey(name: 'Uri')
  final dynamic xmlUri;

  @JsonKey(name: 'InvalidAfterConnect')
  final dynamic xmlInvalidAfterConnect;

  @JsonKey(name: 'InvalidAfterReboot')
  final dynamic xmlInvalidAfterReboot;

  @JsonKey(name: 'Timeout')
  final dynamic xmltimeout;

  String get uri => xmlUri['\$'];

  bool get invalidAfterConnect =>
      xmlInvalidAfterConnect['\$'].toLowerCase() == 'true';

  bool get invalidAfterReboot =>
      xmlInvalidAfterReboot['\$'].toLowerCase() == 'true';

  MediaUri(this.xmlUri, this.xmlInvalidAfterConnect, this.xmlInvalidAfterReboot,
      this.xmltimeout);

  factory MediaUri.fromJson(Map<String, dynamic> json) =>
      _$MediaUriFromJson(json);

  Map<String, dynamic> toJson() => _$MediaUriToJson(this);
}
