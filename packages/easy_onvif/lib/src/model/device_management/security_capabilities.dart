import 'dart:convert';

import 'package:easy_onvif/src/util/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'security_capabilities.g.dart';

/// Security capabilities.
@JsonSerializable()
class SecurityCapabilities {
  /// Indicates support for TLS 1.0.
  @JsonKey(
    name: 'TLS1.0',
    fromJson: OnvifUtil.stringOrMappedToBool,
    defaultValue: false,
  )
  final bool tls1_0;

  /// Indicates support for TLS 1.1.
  @JsonKey(
    name: 'TLS1.1',
    fromJson: OnvifUtil.stringOrMappedToBool,
    defaultValue: false,
  )
  final bool tls1_1;

  /// Indicates support for TLS 1.2.
  @JsonKey(
    name: 'TLS1.2',
    fromJson: OnvifUtil.stringOrMappedToBool,
    defaultValue: false,
  )
  final bool tls1_2;

  /// Indicates support for onboard key generation.
  @JsonKey(
    name: 'OnboardKeyGeneration',
    fromJson: OnvifUtil.stringOrMappedToBool,
    defaultValue: false,
  )
  final bool onboardKeyGeneration;

  /// Indicates support for access policy configuration.
  @JsonKey(
    name: 'AccessPolicyConfig',
    fromJson: OnvifUtil.stringOrMappedToBool,
    defaultValue: false,
  )
  final bool accessPolicyConfig;

  @JsonKey(
    name: 'DefaultAccessPolicy',
    fromJson: OnvifUtil.stringOrMappedToBool,
    defaultValue: false,
  )
  final bool defaultAccessPolicy;

  @JsonKey(
    name: 'Dot1X',
    fromJson: OnvifUtil.stringOrMappedToBool,
    defaultValue: false,
  )
  final bool dot1x;

  @JsonKey(
    name: 'RemoteUserHandling',
    fromJson: OnvifUtil.stringOrMappedToBool,
    defaultValue: false,
  )
  final bool remoteUserHandling;

  /// Indicates support for WS-Security X.509 token.
  @JsonKey(
    name: 'X.509Token',
    fromJson: OnvifUtil.stringOrMappedToBool,
    defaultValue: false,
  )
  final bool x509Token;

  /// Indicates support for WS-Security SAML token.
  @JsonKey(
    name: 'SAMLToken',
    fromJson: OnvifUtil.stringOrMappedToBool,
    defaultValue: false,
  )
  final bool samlToken;

  /// Indicates support for WS-Security Kerberos token.
  @JsonKey(
    name: 'KerberosToken',
    fromJson: OnvifUtil.stringOrMappedToBool,
    defaultValue: false,
  )
  final bool kerberosToken;

  /// Indicates whether or not WS-Security REL token is supported.
  @JsonKey(
    name: 'RELToken',
    fromJson: OnvifUtil.stringOrMappedToBool,
    defaultValue: false,
  )
  final bool relToken;

  @JsonKey(name: 'Extension')
  final Map<String, dynamic>? extension;

  SecurityCapabilities({
    required this.tls1_0,
    required this.tls1_1,
    required this.tls1_2,
    required this.onboardKeyGeneration,
    required this.accessPolicyConfig,
    required this.defaultAccessPolicy,
    required this.dot1x,
    required this.remoteUserHandling,
    required this.x509Token,
    required this.samlToken,
    required this.kerberosToken,
    required this.relToken,
    this.extension,
  });

  factory SecurityCapabilities.fromJson(Map<String, dynamic> json) =>
      _$SecurityCapabilitiesFromJson(_removeAtSymbol(json));

  Map<String, dynamic> toJson() => _$SecurityCapabilitiesToJson(this);

  static Map<String, dynamic> _removeAtSymbol(Map<String, dynamic> json) => {
    for (var entry in json.entries)
      entry.key.replaceFirst('@', ''): entry.value,
  };

  @override
  String toString() => json.encode(toJson());
}
