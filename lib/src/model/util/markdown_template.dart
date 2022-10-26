import 'dart:convert';

import 'package:easy_onvif/src/model/util/ext.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:yaml/yaml.dart';

part 'markdown_template.g.dart';

@JsonSerializable()
class MarkdownTemplate {
  final String name;
  final String type;

  MarkdownTemplate({
    required this.name,
    required this.type,
  });

  factory MarkdownTemplate.fromYamlMap(YamlMap template) {
    final checkKeys = <String>[
      'name',
      'type',
    ];

    if (!template.mapHasAllKeys(checkKeys)) {
      throw Exception('The config file is missing a template key.');
    }

    return MarkdownTemplate(
      name: template['name'],
      type: template['type'],
    );
  }

  factory MarkdownTemplate.fromJson(Map<String, dynamic> json) =>
      _$MarkdownTemplateFromJson(json);

  Map<String, dynamic> toJson() => _$MarkdownTemplateToJson(this);

  @override
  String toString() => json.encode(toJson());
}
