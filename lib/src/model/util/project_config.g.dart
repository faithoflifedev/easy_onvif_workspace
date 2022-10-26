// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectConfig _$ProjectConfigFromJson(Map<String, dynamic> json) =>
    ProjectConfig(
      repo: json['repo'] as String,
      pkg: Pkg.fromJson(json['pkg'] as Map<String, dynamic>),
      meta: json['meta'] as String,
      templates: (json['templates'] as List<dynamic>)
          .map((e) => MarkdownTemplate.fromJson(e as Map<String, dynamic>))
          .toList(),
      version: json['version'] as String,
      commit: json['commit'] as String,
      change: json['change'] as String,
    );

Map<String, dynamic> _$ProjectConfigToJson(ProjectConfig instance) =>
    <String, dynamic>{
      'repo': instance.repo,
      'pkg': instance.pkg,
      'meta': instance.meta,
      'templates': instance.templates,
      'version': instance.version,
      'commit': instance.commit,
      'change': instance.change,
    };
