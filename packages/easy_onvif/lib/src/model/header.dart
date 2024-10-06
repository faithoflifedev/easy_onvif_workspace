import 'dart:convert';

import 'package:easy_onvif/util.dart';

import 'package:easy_onvif/shared.dart';
import 'package:easy_onvif/soap.dart' show Xmlns;
import 'package:easy_onvif/src/model/probe/app_sequence.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:xml/xml.dart';

import 'security.dart';

part 'header.g.dart';

@JsonSerializable()
class Header implements XmlSerializable {
  @JsonKey(includeFromJson: false)
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

  @override
  String toString() => json.encode(toJson());

  @override
  void buildXml(
    XmlBuilder builder, {
    String tag = 'Header',
    String? namespace = Xmlns.s,
  }) {
    builder.element(
      tag,
      namespace: namespace,
      nest: () {
        security?.buildXml(builder);

        appSequence?.buildXml(builder);

        messageID?.buildXml(
          builder,
          tag: 'MessageID',
        );

        relatesTo?.buildXml(
          builder,
          tag: 'RelatesTo',
        );

        to?.buildXml(
          builder,
          tag: 'To',
        );

        action?.buildXml(
          builder,
          tag: 'Action',
        );
      },
    );
  }
}
