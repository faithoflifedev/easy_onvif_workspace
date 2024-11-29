import 'dart:convert';

import 'package:easy_onvif/src/util/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'extension.g.dart';

/// Network capabilities.
@JsonSerializable()
class Extension {
  /// Indicates support for IP filtering.
  @JsonKey(
      name: 'Dot11Configuration', fromJson: OnvifUtil.nullableBoolMappedFromXml)
  final bool? dot11Configuration;

  @JsonKey(name: 'Extension')
  final Extension? extension;

  Extension({
    this.dot11Configuration,
    this.extension,
  });

  factory Extension.fromJson(Map<String, dynamic> json) =>
      _$ExtensionFromJson(json);

  Map<String, dynamic> toJson() => _$ExtensionToJson(this);

  @override
  String toString() => json.encode(toJson());
}
