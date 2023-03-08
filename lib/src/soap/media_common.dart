import 'package:xml/xml.dart';

import 'transport.dart';

class MediaCommon {
  /// XML for the [getMetadataConfigurationOptions]
  static XmlDocumentFragment getMetadataConfigurationOptions({
    String? configurationToken,
    String? profileToken,
    required String namespace,
  }) {
    Transport.builder.element('GetMetadataConfigurationOptions', nest: () {
      Transport.builder.namespace(namespace);

      if (configurationToken != null) {
        Transport.builder.element('ConfigurationToken', nest: () {
          Transport.builder.text(configurationToken);
        });
      }

      if (profileToken != null) {
        Transport.builder.element('ProfileToken', nest: () {
          Transport.builder.text(profileToken);
        });
      }
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [getMetadataConfigurations]
  static XmlDocumentFragment getMetadataConfigurations({
    String? configurationToken,
    String? profileToken,
    required String namespace,
  }) {
    Transport.builder.element('GetMetadataConfigurations', nest: () {
      Transport.builder.namespace(namespace);

      if (configurationToken != null) {
        Transport.builder.element('ConfigurationToken', nest: () {
          Transport.builder.text(configurationToken);
        });
      }

      if (profileToken != null) {
        Transport.builder.element('ProfileToken', nest: () {
          Transport.builder.text(profileToken);
        });
      }
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [startMulticastStreaming]
  static XmlDocumentFragment startMulticastStreaming({
    required String profileToken,
    required String namespace,
  }) {
    Transport.builder.element('StartMulticastStreaming', nest: () {
      Transport.builder.namespace(namespace);
      Transport.builder.element('ProfileToken', nest: () {
        Transport.builder.text(profileToken);
      });
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [stopMulticastStreaming]
  static XmlDocumentFragment stopMulticastStreaming({
    required String profileToken,
    required String namespace,
  }) {
    Transport.builder.element('StopMulticastStreaming', nest: () {
      Transport.builder.namespace(namespace);
      Transport.builder.element('ProfileToken', nest: () {
        Transport.builder.text(profileToken);
      });
    });

    return Transport.builder.buildFragment();
  }
}
