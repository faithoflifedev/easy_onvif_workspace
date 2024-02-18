import 'dart:convert';

import 'package:easy_onvif/soap.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:xml/xml.dart';

import 'vector_2d.dart';

part 'vector_1d.g.dart';

@JsonSerializable()
class Vector1D {
  @JsonKey(name: '@x', fromJson: double.parse)
  final double x;

  @JsonKey(name: '@space')
  final Space? selector;

  Vector1D({
    required this.x,
    this.selector,
  });

  factory Vector1D.fromString({required String x}) =>
      Vector1D(x: double.parse(x));

  factory Vector1D.fromJson(Map<String, dynamic> json) =>
      _$Vector1DFromJson(json);

  Map<String, dynamic> toJson() => _$Vector1DToJson(this);

  @override
  String toString() => json.encode(toJson());

  void buildXml(
    XmlBuilder builder, {
    String tag = 'Vector2D',
    String namespace = Xmlns.tt,
  }) =>
      builder.element(tag, nest: () {
        builder.namespace(namespace);

        builder.attribute('x', x);

        if (selector != null) {
          builder.attribute('space', selector!.space);
        }
      });
}
