import 'package:xml/xml.dart';

import 'media1.dart';
import 'media2.dart';

class MediaBoth {
  /// XML for the [audioSources]
  static XmlDocumentFragment getAudioSources() =>
      MediaRequest.getAudioSources();

  /// XML for the [metadataConfiguration]
  static XmlDocumentFragment getMetadataConfiguration(
    String configurationToken,
  ) => MediaRequest.getMetadataConfiguration(configurationToken);

  /// XML for the [getMetadataConfigurationOptions]
  static XmlDocumentFragment getMetadataConfigurationOptions({
    String? configurationToken,
    String? profileToken,
  }) => Media2Request.getMetadataConfigurationOptions(
    configurationToken: configurationToken,
    profileToken: profileToken,
  );

  /// XML for the [getMetadataConfigurations]
  static XmlDocumentFragment getMetadataConfigurations({
    String? configurationToken,
    String? profileToken,
  }) => Media2Request.getMetadataConfigurations(
    configurationToken: configurationToken,
    profileToken: profileToken,
  );

  /// XML for the [getProfiles]
  static XmlDocumentFragment getProfiles() => Media2Request.getProfiles();

  /// XML for the [getServiceCapabilities]
  static XmlDocumentFragment getServiceCapabilities() =>
      Media2Request.getServiceCapabilities();

  /// XML for the [getSnapshotUri], requires a [profileToken]
  static XmlDocumentFragment getSnapshotUri(String profileToken) =>
      Media2Request.getSnapshotUri(profileToken);

  /// XML for the [getStreamUri], requires a [profileToken]
  static XmlDocumentFragment getStreamUri(String profileToken) =>
      Media2Request.getStreamUri(profileToken);

  /// XML for the [videoSources]
  static XmlDocumentFragment getVideoSources() =>
      MediaRequest.getVideoSources();

  /// XML for the [startMulticastStreaming]
  static XmlDocumentFragment startMulticastStreaming(String profileToken) =>
      Media2Request.startMulticastStreaming(profileToken);

  /// XML for the [stopMulticastStreaming]
  static XmlDocumentFragment stopMulticastStreaming(String profileToken) =>
      Media2Request.stopMulticastStreaming(profileToken);
}
