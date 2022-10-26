import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:easy_onvif/src/model/util/ext.dart';
import 'package:universal_io/io.dart';
import 'package:yaml/yaml.dart';

import 'markdown_template.dart';
import 'package.dart';

part 'project_config.g.dart';

@JsonSerializable()
class ProjectConfig {
  final String repo;
  final Pkg pkg;
  final String meta;
  final List<MarkdownTemplate> templates;
  final String version;
  final String commit;
  final String change;

  ProjectConfig({
    required this.repo,
    required this.pkg,
    required this.meta,
    required this.templates,
    required this.version,
    required this.commit,
    required this.change,
  });

  factory ProjectConfig.fromYamlFile(String filePath) {
    final YamlMap config = loadYaml(File(filePath).readAsStringSync());

    final checkKeys = <String>[
      'repo',
      'pkg',
      'meta',
      'templates',
      'version',
      'commit',
      'change'
    ];

    if (!config.mapHasAllKeys(checkKeys)) {
      throw Exception('The config file is missing a top level key.');
    }

    return ProjectConfig(
      repo: config['repo'],
      pkg: Pkg.fromYamlMap(config['pkg']),
      meta: config['meta'],
      templates: (config['templates'] as List)
          .map((template) => MarkdownTemplate.fromYamlMap(template))
          .toList(),
      version: config['version'],
      commit: config['commit'],
      change: config['change'],
    );
  }

  factory ProjectConfig.fromJson(Map<String, dynamic> json) =>
      _$ProjectConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectConfigToJson(this);

  @override
  String toString() => json.encode(toJson());
}
