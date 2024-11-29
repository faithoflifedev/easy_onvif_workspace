import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'media_uri.g.dart';

@JsonSerializable()
class MediaUri {
  static final _xmlMappedFields = <String>[
    'Uri',
    'InvalidAfterConnect',
    'InvalidAfterReboot',
    'Timeout',
  ];
  @JsonKey(
    name: 'Uri',
    fromJson: OnvifUtil.stringMappedFromXml,
  )
  final String uri;

  @JsonKey(
    name: 'InvalidAfterConnect',
    fromJson: OnvifUtil.boolMappedFromXml,
  )
  final bool invalidAfterConnect;

  @JsonKey(
    name: 'InvalidAfterReboot',
    fromJson: OnvifUtil.boolMappedFromXml,
  )
  final bool invalidAfterReboot;

  @JsonKey(name: 'Timeout')
  final String timeout;

  MediaUri({
    required this.uri,
    required this.invalidAfterConnect,
    required this.invalidAfterReboot,
    required this.timeout,
  });

  factory MediaUri.fromJson(Map<String, dynamic> json) =>
      _$MediaUriFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MediaUriToJson(this).convertFieldsToXmlMap(_xmlMappedFields);

  @override
  String toString() => json.encode(toJson());
}
