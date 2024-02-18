import 'dart:convert';

import 'package:easy_onvif/soap.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:xml/xml.dart';

part 'vector_2d.g.dart';

@JsonSerializable()
class Vector2D {
  @JsonKey(name: '@x', fromJson: double.parse)
  final double x;

  @JsonKey(name: '@y', fromJson: double.parse)
  final double y;

  /// coordinate space selector
  @JsonKey(name: '@space')
  final Space? selector;

  Vector2D({
    required this.x,
    required this.y,
    this.selector,
  });

  factory Vector2D.fromString({required String x, required String y}) =>
      Vector2D(x: double.parse(x), y: double.parse(y));

  factory Vector2D.fromJson(Map<String, dynamic> json) =>
      _$Vector2DFromJson(json);

  Map<String, dynamic> toJson() => _$Vector2DToJson(this);

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
        builder.attribute('y', y);

        if (selector != null) {
          builder.attribute('space', selector!.space);
        }
      });
}

@JsonEnum(valueField: 'space')
enum Space {
  zoomPositionGenericSpace(
      'http://www.onvif.org/ver10/tptz/ZoomSpaces/PositionGenericSpace'),
  zoomTranslationGenericSpace(
      'http://www.onvif.org/ver10/tptz/ZoomSpaces/TranslationGenericSpace'),
  zoomVelocityGenericSpace(
      'http://www.onvif.org/ver10/tptz/ZoomSpaces/VelocityGenericSpace'),
  zoomGenericSpeedSpace(
      'http://www.onvif.org/ver10/tptz/ZoomSpaces/GenericSpeedSpace'),

  panTiltPositionGenericSpace(
      'http://www.onvif.org/ver10/tptz/PanTiltSpaces/PositionGenericSpace'),
  panTiltTranslationGenericSpace(
      'http://www.onvif.org/ver10/tptz/PanTiltSpaces/TranslationGenericSpace'),
  panTiltVelocityGenericSpace(
      'http://www.onvif.org/ver10/tptz/PanTiltSpaces/VelocityGenericSpace'),
  panTiltGenericSpeedSpace(
      'http://www.onvif.org/ver10/tptz/PanTiltSpaces/GenericSpeedSpace');

  const Space(this.space);

  final String space;
}
