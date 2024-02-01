import 'dart:convert';

import 'package:easy_onvif/src/soap/xmlns.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:xml/xml.dart';

part 'app_sequence.g.dart';

@JsonSerializable()
class AppSequence {
  @JsonKey(name: '@MessageNumber', fromJson: int.parse)
  final int messageNumber;

  @JsonKey(name: '@InstanceId', fromJson: int.parse)
  final int instanceId;

  AppSequence({required this.messageNumber, required this.instanceId});

  factory AppSequence.fromJson(Map<String, dynamic> json) =>
      _$AppSequenceFromJson(json);

  Map<String, dynamic> toJson() => _$AppSequenceToJson(this);

  XmlDocumentFragment toXml(XmlBuilder builder) {
    builder.element(
      'AppSequence',
      namespaces: {Xmlns.ws: 'ws'},
      nest: () {
        builder.attribute(
          'MessageNumber',
          messageNumber,
        );

        builder.attribute(
          'InstanceId',
          instanceId,
        );
      },
    );

    return builder.buildFragment();
  }

  @override
  String toString() => json.encode(toJson());
}
