// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pkg _$PkgFromJson(Map<String, dynamic> json) => Pkg(
      githubBearerToken: json['githubBearerToken'] as String,
      humanName: json['humanName'] as String,
      botName: json['botName'] as String,
      botEmail: json['botEmail'] as String,
      homebrewRepo: json['homebrewRepo'] as String,
    );

Map<String, dynamic> _$PkgToJson(Pkg instance) => <String, dynamic>{
      'githubBearerToken': instance.githubBearerToken,
      'humanName': instance.humanName,
      'botName': instance.botName,
      'botEmail': instance.botEmail,
      'homebrewRepo': instance.homebrewRepo,
    };
