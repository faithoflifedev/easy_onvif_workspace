import 'dart:convert';

import 'package:easy_onvif/soap.dart';
import 'package:easy_onvif/src/model/probe/app_sequence.dart';
import 'package:easy_onvif/src/util/util.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:xml/xml.dart';

import 'security.dart';

part 'header.g.dart';

@JsonSerializable()
class Header {
  @JsonKey(name: 'Security')
  final Security? security;

  @JsonKey(name: 'AppSequence')
  final AppSequence? appSequence;

  @JsonKey(name: 'MessageID', fromJson: OnvifUtil.nullableMappedToString)
  final String? messageID;

  @JsonKey(name: 'RelatesTo', fromJson: OnvifUtil.nullableMappedToString)
  final String? relatesTo;

  @JsonKey(name: 'To', fromJson: OnvifUtil.nullableMappedToString)
  final String? to;

  @JsonKey(name: 'Action', fromJson: OnvifUtil.nullableMappedToString)
  final String? action;

  Header({
    this.security,
    this.appSequence,
    this.messageID,
    this.relatesTo,
    this.to,
    this.action,
  });

  factory Header.fromJson(Map<String, dynamic> json) => _$HeaderFromJson(json);

  Map<String, dynamic> toJson() => _$HeaderToJson(this);

  XmlDocumentFragment toXml(XmlBuilder builder, Authorization authorization) {
    builder.element('Header', namespace: Xmlns.s, nest: () {
      if (security != null) {
        security!.toXml(builder, authorization);
      }
    });

    return builder.buildFragment();
  }

  @override
  String toString() => json.encode(toJson());
}
