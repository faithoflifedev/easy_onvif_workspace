// import 'package:easy_onvif/imaging.dart';
// import 'package:easy_onvif/shared.dart';
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
}
