import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'include.dart';

part 'attachment_data.g.dart';

/// The log information as attachment data.
@JsonSerializable()
class AttachmentData {
  @JsonKey(name: 'contentType', fromJson: OnvifUtil.nullableStringMappedFromXml)
  final String? contentType;

  /// The log information as character data.
  @JsonKey(name: 'Include')
  final Include? include;

  AttachmentData({
    this.contentType,
    this.include,
  });

  factory AttachmentData.fromJson(Map<String, dynamic> json) =>
      _$AttachmentDataFromJson(json);

  Map<String, dynamic> toJson() => _$AttachmentDataToJson(this);

  @override
  String toString() => json.encode(toJson());
}
