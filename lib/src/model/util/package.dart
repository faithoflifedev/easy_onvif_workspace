import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:easy_onvif/src/model/util/ext.dart';
import 'package:yaml/yaml.dart';

part 'package.g.dart';

@JsonSerializable()
class Pkg {
  final String githubBearerToken;
  final String humanName;
  final String botName;
  final String botEmail;
  // final Map<String, String> executables;
  final String homebrewRepo;
  // final String homebrewFormula;

  Pkg({
    required this.githubBearerToken,
    required this.humanName,
    required this.botName,
    required this.botEmail,
    // required this.executables,
    required this.homebrewRepo,
    // required this.homebrewFormula,
  });

  factory Pkg.fromYamlMap(YamlMap pkg) {
    final checkKeys = <String>[
      'githubBearerToken',
      'humanName',
      'botName',
      'botEmail',
      // 'executables',
      'homebrewRepo',
      // 'homebrewFormula'
    ];

    if (!pkg.mapHasAllKeys(checkKeys)) {
      throw Exception('The config file is missing a pkg key.');
    }

    return Pkg(
      githubBearerToken: pkg['githubBearerToken'],
      humanName: pkg['humanName'],
      botName: pkg['botName'],
      botEmail: pkg['botEmail'],
      // executables: pkg['executables'].cast<String, String>(),
      homebrewRepo: pkg['homebrewRepo'],
      // homebrewFormula: pkg['homebrewFormula'],
    );
  }

  factory Pkg.fromJson(Map<String, dynamic> json) => _$PkgFromJson(json);

  Map<String, dynamic> toJson() => _$PkgToJson(this);

  @override
  String toString() => json.encode(toJson());
}
