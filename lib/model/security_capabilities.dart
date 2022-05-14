import 'dart:convert';

import 'package:easy_onvif/util/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'security_capabilities.g.dart';

///Security capabilities.
@JsonSerializable()
class SecurityCapabilities {
  ///Indicates support for TLS 1.0.
  @JsonKey(name: '@TLS1.0', fromJson: stringToBool)
  final bool tls1_0;

  ///Indicates support for TLS 1.1.
  @JsonKey(name: '@TLS1.1', fromJson: stringToBool)
  final bool tls1_1;

  ///Indicates support for TLS 1.2.
  @JsonKey(name: '@TLS1.2', fromJson: stringToBool)
  final bool tls1_2;

  ///Indicates support for onboard key generation.
  @JsonKey(name: '@OnboardKeyGeneration', fromJson: stringToBool)
  final bool onboardKeyGeneration;

  ///Indicates support for access policy configuration.
  @JsonKey(name: '@AccessPolicyConfig', fromJson: stringToBool)
  final bool accessPolicyConfig;

  ///Indicates support for the ONVIF default access policy.
  @JsonKey(name: '@DefaultAccessPolicy', fromJson: stringToBool)
  final bool defaultAccessPolicy;

  ///Indicates support for IEEE 802.1X configuration.
  @JsonKey(name: '@Dot1X', fromJson: stringToBool)
  final bool dot1X;

  ///Indicates support for remote user configuration. Used when accessing another device.
  @JsonKey(name: '@RemoteUserHandling', fromJson: stringToBool)
  final bool remoteUserHandling;

  ///Indicates support for WS-Security X.509 token.
  @JsonKey(name: '@X.509Token', fromJson: stringToBool)
  final bool x509Token;

  ///Indicates support for WS-Security SAML token.
  @JsonKey(name: '@SAMLToken', fromJson: stringToBool)
  final bool samlToken;

  ///Indicates support for WS-Security Kerberos token.
  @JsonKey(name: '@KerberosToken', fromJson: stringToBool)
  final bool kerberosToken;

  ///Indicates support for WS-Security Username token.
  @JsonKey(name: '@UsernameToken', fromJson: stringToBool)
  final bool usernameToken;

  ///Indicates support for WS over HTTP digest authenticated communication layer.
  @JsonKey(name: '@HttpDigest', fromJson: stringToBool)
  final bool httpDigest;

  ///Indicates support for WS-Security REL token.
  @JsonKey(name: '@RELToken', fromJson: stringToBool)
  final bool relToken;

  ///EAP Methods supported by the device. The int values refer to the [IANA EAP Registry](http://www.iana.org/assignments/eap-numbers/eap-numbers.xhtml).
  @JsonKey(name: '@SupportedEAPMethods', fromJson: stringToInt)
  final int supportedEAPMethods;

  ///The maximum number of users that the device supports.
  @JsonKey(name: '@MaxUsers', fromJson: stringToInt)
  final int maxUsers;

  ///Maximum number of characters supported for the username by CreateUsers.
  @JsonKey(name: '@MaxUserNameLength', fromJson: stringToInt)
  final int maxUserNameLength;

  ///Maximum number of characters supported for the password by CreateUsers and SetUser.
  @JsonKey(name: '@MaxPasswordLength', fromJson: stringToInt)
  final int maxPasswordLength;

  ///Indicates which security policies are supported. Options are: ModifyPassword, PasswordComplexity, AuthFailureWarnings
  @JsonKey(name: '@SecurityPolicies')
  final String? securityPolicies;

  ///Maximum number of passwords that the device can remember for each user
  @JsonKey(name: '@MaxPasswordHistory', fromJson: nullableToInt)
  final int? maxPasswordHistory;

  SecurityCapabilities(
      {required this.tls1_0,
      required this.tls1_1,
      required this.tls1_2,
      required this.onboardKeyGeneration,
      required this.accessPolicyConfig,
      required this.defaultAccessPolicy,
      required this.dot1X,
      required this.remoteUserHandling,
      required this.x509Token,
      required this.samlToken,
      required this.kerberosToken,
      required this.usernameToken,
      required this.httpDigest,
      required this.relToken,
      required this.supportedEAPMethods,
      required this.maxUsers,
      required this.maxUserNameLength,
      required this.maxPasswordLength,
      this.securityPolicies,
      this.maxPasswordHistory});

  factory SecurityCapabilities.fromJson(Map<String, dynamic> json) =>
      _$SecurityCapabilitiesFromJson(json);

  Map<String, dynamic> toJson() => _$SecurityCapabilitiesToJson(this);

  @override
  String toString() => json.encode(toJson());
}
