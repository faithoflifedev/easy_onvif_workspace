// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'security_capabilities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SecurityCapabilities _$SecurityCapabilitiesFromJson(
        Map<String, dynamic> json) =>
    SecurityCapabilities(
      tls1_0: stringToBool(json['@TLS1.0'] as String),
      tls1_1: stringToBool(json['@TLS1.1'] as String),
      tls1_2: stringToBool(json['@TLS1.2'] as String),
      onboardKeyGeneration:
          stringToBool(json['@OnboardKeyGeneration'] as String),
      accessPolicyConfig: stringToBool(json['@AccessPolicyConfig'] as String),
      defaultAccessPolicy: stringToBool(json['@DefaultAccessPolicy'] as String),
      dot1X: stringToBool(json['@Dot1X'] as String),
      remoteUserHandling: stringToBool(json['@RemoteUserHandling'] as String),
      x509Token: stringToBool(json['@X.509Token'] as String),
      samlToken: stringToBool(json['@SAMLToken'] as String),
      kerberosToken: stringToBool(json['@KerberosToken'] as String),
      usernameToken: stringToBool(json['@UsernameToken'] as String),
      httpDigest: stringToBool(json['@HttpDigest'] as String),
      relToken: stringToBool(json['@RELToken'] as String),
      supportedEAPMethods: stringToInt(json['@SupportedEAPMethods'] as String),
      maxUsers: stringToInt(json['@MaxUsers'] as String),
      maxUserNameLength: stringToInt(json['@MaxUserNameLength'] as String),
      maxPasswordLength: stringToInt(json['@MaxPasswordLength'] as String),
      securityPolicies: json['@SecurityPolicies'] as String?,
      maxPasswordHistory:
          nullableStringToInt(json['@MaxPasswordHistory'] as String?),
    );

Map<String, dynamic> _$SecurityCapabilitiesToJson(
        SecurityCapabilities instance) =>
    <String, dynamic>{
      '@TLS1.0': instance.tls1_0,
      '@TLS1.1': instance.tls1_1,
      '@TLS1.2': instance.tls1_2,
      '@OnboardKeyGeneration': instance.onboardKeyGeneration,
      '@AccessPolicyConfig': instance.accessPolicyConfig,
      '@DefaultAccessPolicy': instance.defaultAccessPolicy,
      '@Dot1X': instance.dot1X,
      '@RemoteUserHandling': instance.remoteUserHandling,
      '@X.509Token': instance.x509Token,
      '@SAMLToken': instance.samlToken,
      '@KerberosToken': instance.kerberosToken,
      '@UsernameToken': instance.usernameToken,
      '@HttpDigest': instance.httpDigest,
      '@RELToken': instance.relToken,
      '@SupportedEAPMethods': instance.supportedEAPMethods,
      '@MaxUsers': instance.maxUsers,
      '@MaxUserNameLength': instance.maxUserNameLength,
      '@MaxPasswordLength': instance.maxPasswordLength,
      '@SecurityPolicies': instance.securityPolicies,
      '@MaxPasswordHistory': instance.maxPasswordHistory,
    };
