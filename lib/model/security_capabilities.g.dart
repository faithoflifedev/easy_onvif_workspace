// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'security_capabilities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SecurityCapabilities _$SecurityCapabilitiesFromJson(
        Map<String, dynamic> json) =>
    SecurityCapabilities(
      tls1_0: OnvifUtil.stringToBool(json['@TLS1.0'] as String),
      tls1_1: OnvifUtil.stringToBool(json['@TLS1.1'] as String),
      tls1_2: OnvifUtil.stringToBool(json['@TLS1.2'] as String),
      onboardKeyGeneration:
          OnvifUtil.stringToBool(json['@OnboardKeyGeneration'] as String),
      accessPolicyConfig:
          OnvifUtil.stringToBool(json['@AccessPolicyConfig'] as String),
      defaultAccessPolicy:
          OnvifUtil.stringToBool(json['@DefaultAccessPolicy'] as String),
      dot1X: OnvifUtil.stringToBool(json['@Dot1X'] as String),
      remoteUserHandling:
          OnvifUtil.stringToBool(json['@RemoteUserHandling'] as String),
      x509Token: OnvifUtil.stringToBool(json['@X.509Token'] as String),
      samlToken: OnvifUtil.stringToBool(json['@SAMLToken'] as String),
      kerberosToken: OnvifUtil.stringToBool(json['@KerberosToken'] as String),
      usernameToken: OnvifUtil.stringToBool(json['@UsernameToken'] as String),
      httpDigest: OnvifUtil.stringToBool(json['@HttpDigest'] as String),
      relToken: OnvifUtil.stringToBool(json['@RELToken'] as String),
      supportedEAPMethods: int.parse(json['@SupportedEAPMethods'] as String),
      maxUsers: int.parse(json['@MaxUsers'] as String),
      maxUserNameLength: int.parse(json['@MaxUserNameLength'] as String),
      maxPasswordLength: int.parse(json['@MaxPasswordLength'] as String),
      securityPolicies: json['@SecurityPolicies'] as String?,
      maxPasswordHistory: json['@MaxPasswordHistory'] as int?,
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
