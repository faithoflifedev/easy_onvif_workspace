import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'attachment_data.dart';

part 'system_information.g.dart';

/// Contains the arbitrary device diagnostics information.
@JsonSerializable()
class SystemInformation {
  /// The log information as attachment data.
  @JsonKey(name: 'Binary')
  final AttachmentData? binary;

  /// The log information as character data.
  @JsonKey(name: 'String', fromJson: OnvifUtil.nullableStringMappedFromXml)
  final String? string;

  SystemInformation({required this.binary, this.string});

  factory SystemInformation.fromJson(Map<String, dynamic> json) =>
      _$SystemInformationFromJson(json);

  Map<String, dynamic> toJson() => _$SystemInformationToJson(this);

  @override
  String toString() => json.encode(toJson());
}
