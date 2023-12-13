import 'package:xml/xml.dart';

import 'transport.dart';
import 'xmlns.dart';

class ThermalRequest {
  /// XML for the [getConfiguration]
  static XmlDocumentFragment getConfiguration(String videoSourceToken) {
    Transport.builder.element('GetConfiguration', nest: () {
      Transport.builder.namespace(Xmlns.tth);

      Transport.builder.element('VideoSourceToken', nest: () {
        Transport.builder.text(videoSourceToken);
      });
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [getConfigurations]
  static XmlDocumentFragment getConfigurations() => Transport.quickTag(
        'GetConfigurations',
        Xmlns.tth,
      );
}
