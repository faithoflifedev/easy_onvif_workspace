import 'package:easy_onvif/media1.dart' hide Transport;
import 'package:xml/xml.dart';

import 'media_common.dart';
import 'transport.dart';
import 'xmlns.dart';

class MediaRequest {
  /// XML for the [getAudioSources]
  static XmlDocumentFragment getAudioSources() =>
      Transport.quickTag('GetAudioSources', Xmlns.trt);

  /// XML for the [getAudioOutputs]
  static XmlDocumentFragment getAudioOutputs() =>
      Transport.quickTag('GetAudioOutputs', Xmlns.trt);

  /// XML for the [getMetadataConfiguration]
  static XmlDocumentFragment getMetadataConfiguration(
      String configurationToken) {
    Transport.builder.element('GetMetadataConfiguration', nest: () {
      Transport.builder.namespace(Xmlns.tds);
      Transport.builder.element('ConfigurationToken', nest: () {
        Transport.builder.text(configurationToken);
      });
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [getMetadataConfigurationOptions]
  static XmlDocumentFragment getMetadataConfigurationOptions({
    String? configurationToken,
    String? profileToken,
    required String namespace,
  }) =>
      MediaCommon.getMetadataConfigurationOptions(
        configurationToken: configurationToken,
        profileToken: profileToken,
        namespace: Xmlns.trt,
      );

  /// XML for the [getMetadataConfigurations]
  static XmlDocumentFragment getMetadataConfigurations({
    String? configurationToken,
    String? profileToken,
  }) =>
      MediaCommon.getMetadataConfigurations(
        configurationToken: configurationToken,
        profileToken: profileToken,
        namespace: Xmlns.trt,
      );

  /// XML for the [getProfile], requires a [profileToken]
  static XmlDocumentFragment getProfile(String profileToken) {
    Transport.builder.element('GetProfile', nest: () {
      Transport.builder.namespace(Xmlns.tds);
      Transport.builder.element('ProfileToken', nest: () {
        Transport.builder.text(profileToken);
      });
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [getProfiles]
  static XmlDocumentFragment getProfiles() =>
      Transport.quickTag('GetProfiles', Xmlns.trt);

  /// XML for the [getServiceCapabilities]
  static XmlDocumentFragment getServiceCapabilities() =>
      Transport.quickTag('GetServiceCapabilities', Xmlns.trt);

  /// XML for the [getSnapshotUri], requires a [profileToken]
  static XmlDocumentFragment getSnapshotUri(String profileToken,
      {StreamSetup? streamSetup}) {
    Transport.builder.element('GetSnapshotUri', nest: () {
      Transport.builder.namespace(Xmlns.trt);
      Transport.builder.element('ProfileToken', nest: () {
        Transport.builder.text(profileToken);
      });
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [getStreamUri], requires a [profileToken]
  static XmlDocumentFragment getStreamUri(String profileToken,
      {required StreamSetup streamSetup}) {
    Transport.builder.element('GetStreamUri', nest: () {
      Transport.builder.namespace(Xmlns.trt);

      Transport.builder.element('StreamSetup', nest: () {
        Transport.builder.namespace(Xmlns.trt);
        Transport.builder.element('Stream', nest: () {
          Transport.builder.namespace(Xmlns.tt);
          Transport.builder.text(streamSetup.stream);
        });
        Transport.builder.element('Transport', nest: () {
          Transport.builder.namespace(Xmlns.tt);
          Transport.builder.element('Protocol', nest: () {
            Transport.builder.namespace(Xmlns.tt);
            Transport.builder.text(streamSetup.transport.protocol);
          });
        });
      });

      Transport.builder.element('ProfileToken', nest: () {
        Transport.builder.text(profileToken);
      });
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [getVideoSources]
  static XmlDocumentFragment getVideoSources() =>
      Transport.quickTag('GetVideoSources', Xmlns.trt);

  /// XML for the [startMulticastStreaming]
  static XmlDocumentFragment startMulticastStreaming(String profileToken) =>
      MediaCommon.startMulticastStreaming(
          profileToken: profileToken, namespace: Xmlns.trt);

  /// XML for the [stopMulticastStreaming]
  static XmlDocumentFragment stopMulticastStreaming(String profileToken) =>
      MediaCommon.stopMulticastStreaming(
          profileToken: profileToken, namespace: Xmlns.trt);
}
