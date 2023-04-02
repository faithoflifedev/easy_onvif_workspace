import 'package:xml/xml.dart';

import 'media_common.dart';
import 'transport.dart';
import 'xmlns.dart';

class Media2Request {
  /// XML for the [getMetadataConfigurationOptions]
  static XmlDocumentFragment getMetadataConfigurationOptions(
          {String? configurationToken, String? profileToken}) =>
      MediaCommon.getMetadataConfigurationOptions(
        configurationToken: configurationToken,
        profileToken: profileToken,
        namespace: Xmlns.tr2,
      );

  /// XML for the [getMetadataConfigurations]
  static XmlDocumentFragment getMetadataConfigurations(
          {String? configurationToken, String? profileToken}) =>
      MediaCommon.getMetadataConfigurations(
        configurationToken: configurationToken,
        profileToken: profileToken,
        namespace: Xmlns.tr2,
      );

  /// XML for the [getProfiles]
  static XmlDocumentFragment getProfiles() =>
      Transport.quickTag('GetProfiles', Xmlns.tr2);

  /// XML for the [getServiceCapabilities]
  static XmlDocumentFragment getServiceCapabilities() =>
      Transport.quickTag('GetServiceCapabilities', Xmlns.tr2);

  /// XML for the [getSnapshotUri], requires a [profileToken]
  static XmlDocumentFragment getSnapshotUri(String profileToken) {
    Transport.builder.element('GetSnapshotUri', nest: () {
      Transport.builder.namespace(Xmlns.tr2);
      Transport.builder.element('ProfileToken', nest: () {
        Transport.builder.text(profileToken);
      });
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [getStreamUri], requires a [profileToken]
  static XmlDocumentFragment getStreamUri(String profileToken,
      {String protocol = 'RTSP'}) {
    Transport.builder.element('GetStreamUri', nest: () {
      Transport.builder.namespace(Xmlns.tr2);
      Transport.builder.element('Protocol', nest: () {
        Transport.builder.namespace(Xmlns.tt);
        Transport.builder.text(protocol);
      });

      Transport.builder.element('ProfileToken', nest: () {
        Transport.builder.namespace(Xmlns.tt);
        Transport.builder.text(profileToken);
      });
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [getVideoEncoderInstances]
  static XmlDocumentFragment getVideoEncoderInstances(
      String configurationToken) {
    Transport.builder.element('GetVideoEncoderInstances', nest: () {
      Transport.builder.namespace(Xmlns.tr2);
      Transport.builder.element('ConfigurationToken', nest: () {
        Transport.builder.text(configurationToken);
      });
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [startMulticastStreaming]
  static XmlDocumentFragment startMulticastStreaming(String profileToken) =>
      MediaCommon.startMulticastStreaming(
          profileToken: profileToken, namespace: Xmlns.tr2);

  /// XML for the [stopMulticastStreaming]
  static XmlDocumentFragment stopMulticastStreaming(String profileToken) =>
      MediaCommon.stopMulticastStreaming(
          profileToken: profileToken, namespace: Xmlns.tr2);
}
