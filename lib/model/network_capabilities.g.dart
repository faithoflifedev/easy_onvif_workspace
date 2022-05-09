// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_capabilities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkCapabilities _$NetworkCapabilitiesFromJson(Map<String, dynamic> json) =>
    NetworkCapabilities(
      ipFilter: stringToBool(json['@IPFilter'] as String),
      zeroConfiguration: stringToBool(json['@ZeroConfiguration'] as String),
      ipVersion6: stringToBool(json['@IPVersion6'] as String),
      dynDNS: stringToBool(json['@DynDNS'] as String),
      dot11Configuration: stringToBool(json['@Dot11Configuration'] as String),
      dot1xConfiguration: stringToInt(json['@Dot1XConfigurations'] as String),
      hostnameFromDHCP: stringToBool(json['@HostnameFromDHCP'] as String),
      ntp: stringToInt(json['@NTP'] as String),
      dhcpv6: stringToBool(json['@DHCPv6'] as String),
    );

Map<String, dynamic> _$NetworkCapabilitiesToJson(
        NetworkCapabilities instance) =>
    <String, dynamic>{
      '@IPFilter': instance.ipFilter,
      '@ZeroConfiguration': instance.zeroConfiguration,
      '@IPVersion6': instance.ipVersion6,
      '@DynDNS': instance.dynDNS,
      '@Dot11Configuration': instance.dot11Configuration,
      '@Dot1XConfigurations': instance.dot1xConfiguration,
      '@HostnameFromDHCP': instance.hostnameFromDHCP,
      '@NTP': instance.ntp,
      '@DHCPv6': instance.dhcpv6,
    };
