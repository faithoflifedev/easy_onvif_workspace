import 'dart:convert';

import 'package:easy_onvif/soap.dart';
import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'filter.g.dart';

/// Optional filter defining on which event condition a recording job gets
/// active.
@JsonSerializable()
class Filter {
  /// Topic filter as defined in section 9.6.3 of the ONVIF Core Specification.
  @JsonKey(name: 'Topic', fromJson: OnvifUtil.mappedToString)
  final String topic;

  /// Optional message source content filter as defined in section 9.4.4 of the
  /// ONVIF Core Specification.
  @JsonKey(name: 'Source', fromJson: OnvifUtil.mappedToString)
  final String? source;

  Filter({
    required this.topic,
    this.source,
  });

  factory Filter.fromJson(Map<String, dynamic> json) => _$FilterFromJson(json);

  Map<String, dynamic> toJson() => _$FilterToJson(this);

  @override
  String toString() => json.encode(toJson());

  void toXml() {
    Transport.builder.element('Filter', nest: () {
      Transport.builder.namespace(Xmlns.tt);

      Transport.builder.element('Topic', nest: () {
        Transport.builder.namespace(Xmlns.tt);
        Transport.builder.text(topic);
      });

      if (source != null) {
        Transport.builder.element('Source', nest: () {
          Transport.builder.namespace(Xmlns.tt);
          Transport.builder.text(source!);
        });
      }
    });
  }
}
