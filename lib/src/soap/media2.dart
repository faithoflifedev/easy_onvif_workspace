import 'package:easy_onvif/soap.dart';
import 'package:xml/xml.dart';

import 'media_common.dart';

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
  static XmlDocumentFragment getProfiles() {
    Transport.builder.element('GetProfiles', nest: () {
      Transport.builder.namespace(Xmlns.tr2);
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [getServiceCapabilities]
  static XmlDocumentFragment getServiceCapabilities() {
    Transport.builder.element('GetServiceCapabilities', nest: () {
      Transport.builder.namespace(Xmlns.tr2);
    });

    return Transport.builder.buildFragment();
  }

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
      {String streamType = 'RTP-Unicast', String transportProtocol = 'RTSP'}) {
    Transport.builder.element('GetStreamUri', nest: () {
      Transport.builder.namespace(Xmlns.tr2);

      Transport.builder.element('StreamSetup', nest: () {
        Transport.builder.element('Stream', nest: () {
          Transport.builder.namespace(Xmlns.tt);
          Transport.builder.text(streamType);
        });

        Transport.builder.element('Transport', nest: () {
          Transport.builder.namespace(Xmlns.tt);
          Transport.builder.element('Protocol', nest: () {
            Transport.builder.text(transportProtocol);
          });
        });
      });

      Transport.builder.element('ProfileToken', nest: () {
        Transport.builder.text(profileToken);
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
