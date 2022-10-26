// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_capabilities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkCapabilities _$NetworkCapabilitiesFromJson(Map<String, dynamic> json) =>
    NetworkCapabilities(
      ipFilter: OnvifUtil.stringToBool(json['@IPFilter'] as String),
      zeroConfiguration:
          OnvifUtil.stringToBool(json['@ZeroConfiguration'] as String),
      ipVersion6: OnvifUtil.stringToBool(json['@IPVersion6'] as String),
      dynDNS: OnvifUtil.stringToBool(json['@DynDNS'] as String),
      dot11Configuration:
          OnvifUtil.stringToBool(json['@Dot11Configuration'] as String),
      dot1xConfiguration: int.parse(json['@Dot1XConfigurations'] as String),
      hostnameFromDHCP:
          OnvifUtil.stringToBool(json['@HostnameFromDHCP'] as String),
      ntp: int.parse(json['@NTP'] as String),
      dhcpv6: OnvifUtil.stringToBool(json['@DHCPv6'] as String),
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
