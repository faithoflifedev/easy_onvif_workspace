import 'package:easy_onvif/media1.dart' show StreamSetup;
import 'package:easy_onvif/replay.dart';
import 'package:xml/xml.dart';

import 'transport.dart';
import 'xmlns.dart';

class ReplayRequest {
  /// XML for the [getReplayConfiguration]
  static XmlDocumentFragment getReplayConfiguration() =>
      Transport.quickTag('GetReplayConfiguration', Xmlns.trp);

  /// XML for the [getReplayUri]
  static XmlDocumentFragment getReplayUri(
    String recordingToken, {
    required StreamSetup streamSetup,
  }) {
    Transport.builder.element('GetReplayUri', nest: () {
      Transport.builder.namespace(Xmlns.trp);

      Transport.builder.element('StreamSetup', nest: () {
        Transport.builder.element('Stream', nest: () {
          Transport.builder.namespace(Xmlns.tt);
          Transport.builder.text(streamSetup.stream);
        });

        Transport.builder.element('Transport', nest: () {
          Transport.builder.namespace(Xmlns.tt);
          Transport.builder.element('Protocol', nest: () {
            Transport.builder.text(streamSetup.transport.protocol);
          });
        });
      });

      Transport.builder.element('RecordingToken', nest: () {
        Transport.builder.text(recordingToken);
      });
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [getServiceCapabilities]
  static XmlDocumentFragment getServiceCapabilities() =>
      Transport.quickTag('GetServiceCapabilities', Xmlns.trp);

  /// XML for the [setReplayConfiguration]
  static XmlDocumentFragment setReplayConfiguration(
      ReplayConfiguration configuration) {
    Transport.builder.element('SetReplayConfiguration', nest: () {
      Transport.builder.namespace(Xmlns.trp);

      Transport.builder.element('Configuration', nest: () {
        Transport.builder.element('SessionTimeout', nest: () {
          Transport.builder.namespace(Xmlns.tt);
          Transport.builder.text(configuration.sessionTimeout);
        });
      });
    });

    return Transport.builder.buildFragment();
  }
}
