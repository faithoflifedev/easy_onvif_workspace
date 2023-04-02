import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'attachment_data.g.dart';

/// The log information as attachment data.
@JsonSerializable()
class AttachmentData {
  @JsonKey(name: 'contentType', fromJson: OnvifUtil.nullableMappedToString)
  final String? contentType;

  /// The log information as character data.
  @JsonKey(name: 'Include', fromJson: OnvifUtil.mappedToString)
  final String? string;

  AttachmentData({
    this.contentType,
    required this.string,
  });

  factory AttachmentData.fromJson(Map<String, dynamic> json) =>
      _$AttachmentDataFromJson(json);

  Map<String, dynamic> toJson() => _$AttachmentDataToJson(this);

  @override
  String toString() => json.encode(toJson());
}
