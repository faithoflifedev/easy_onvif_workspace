import 'package:xml/xml.dart';

import 'transport.dart';
import 'xmlns.dart';

class ImagingRequest {
  /// XML for the [getCurrentPreset], requires a [videoSourceToken]
  static XmlDocumentFragment getCurrentPreset(String videoSourceToken) {
    Transport.builder.element('GetCurrentPreset', nest: () {
      Transport.builder.namespace(Xmlns.timg);

      Transport.builder.element('VideoSourceToken', nest: () {
        Transport.builder.text(videoSourceToken);
      });
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [getPresets], requires a [videoSourceToken]
  static XmlDocumentFragment getPresets(String videoSourceToken) {
    Transport.builder.element('GetPresets', nest: () {
      Transport.builder.namespace(Xmlns.timg);

      Transport.builder.element('VideoSourceToken', nest: () {
        Transport.builder.text(videoSourceToken);
      });
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [getServiceCapabilities]
  static XmlDocumentFragment getServiceCapabilities() =>
      Transport.quickTag('GetServiceCapabilities', Xmlns.timg);

  /// XML for the [getStatus], requires a [videoSourceToken]
  static XmlDocumentFragment getStatus(String videoSourceToken) {
    Transport.builder.element('GetStatus', nest: () {
      Transport.builder.namespace(Xmlns.timg);

      Transport.builder.element('VideoSourceToken', nest: () {
        Transport.builder.text(videoSourceToken);
      });
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [setCurrentPreset], requires a [videoSourceToken]
  static XmlDocumentFragment setCurrentPreset({
    required String videoSourceToken,
    required String presetToken,
  }) {
    Transport.builder.element('SetPreset', nest: () {
      Transport.builder.namespace(Xmlns.timg);

      Transport.builder.element('ProfileToken', nest: () {
        Transport.builder.namespace(Xmlns.timg);
        Transport.builder.text(videoSourceToken);
      });

      Transport.builder.element('PresetToken', nest: () {
        Transport.builder.namespace(Xmlns.timg);
        Transport.builder.text(presetToken);
      });
    });

    return Transport.builder.buildFragment();
  }
}
