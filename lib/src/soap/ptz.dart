import 'package:easy_onvif/ptz.dart';
import 'package:easy_onvif/shared.dart';
import 'package:xml/xml.dart';

import 'transport.dart';
import 'xmlns.dart';

class PtzRequest {
  static XmlDocumentFragment absoluteMove(
      String profileToken, PtzVector position, PtzSpeed? speed) {
    Transport.builder.element('AbsoluteMove', nest: () {
      Transport.builder.namespace(Xmlns.tptz); //tptz

      ReferenceToken(profileToken).buildXml(Transport.builder);

      position.buildXml(
        Transport.builder,
        tag: 'Position',
        namespace: Xmlns.tptz,
      );

      speed?.buildXml(
        Transport.builder,
        tag: 'Speed',
        namespace: Xmlns.tptz,
      );
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [continuousMove], requires a [profileToken] and [PtzSpeed],
  /// and optionally [timeout]
  static XmlDocumentFragment continuousMove(String profileToken,
      {required PtzSpeed velocity, int? timeout}) {
    Transport.builder.element('ContinuousMove', nest: () {
      Transport.builder.namespace(Xmlns.tptz); //tptz

      ReferenceToken(profileToken).buildXml(Transport.builder);

      velocity.buildXml(
        Transport.builder,
        tag: 'Velocity',
        namespace: Xmlns.tptz,
      );

      if (timeout != null) {
        Transport.builder.element('Timeout', nest: () {
          Transport.builder.namespace(Xmlns.tptz);
          Transport.builder.text('PT${timeout}S');
        });
      }
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [getCompatibleConfigurations], requires a [profileToken]
  static XmlDocumentFragment getCompatibleConfigurations(String profileToken) {
    Transport.builder.element('GetCompatibleConfigurations', nest: () {
      Transport.builder.namespace(Xmlns.tptz);

      ReferenceToken(profileToken).buildXml(Transport.builder);
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [getConfiguration], requires a [profileToken]
  static XmlDocumentFragment getConfiguration(String profileToken) {
    Transport.builder.element('GetConfiguration', nest: () {
      Transport.builder.namespace(Xmlns.tptz);

      ReferenceToken(profileToken).buildXml(
        Transport.builder,
        tag: 'PTZConfigurationToken',
      );
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [getConfigurationOptions], requires a [profileToken]
  static XmlDocumentFragment getConfigurationOptions(String profileToken) {
    Transport.builder.element('GetConfigurationOptions', nest: () {
      Transport.builder.namespace(Xmlns.tptz);

      ReferenceToken(profileToken).buildXml(
        Transport.builder,
        tag: 'ConfigurationToken',
      );
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [getConfigurations]
  static XmlDocumentFragment getConfigurations() =>
      Transport.quickTag('GetConfigurations', Xmlns.tptz);

  /// XML for the [getPresets], requires a [profileToken]
  static XmlDocumentFragment getPresets(String profileToken) {
    Transport.builder.element('GetPresets', nest: () {
      Transport.builder.namespace(Xmlns.tptz);

      ReferenceToken(profileToken).buildXml(Transport.builder);
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [getPresetTour], requires a [profileToken] and [presetTourToken]
  static XmlDocumentFragment getPresetTour(
    String profileToken, {
    required String presetTourToken,
  }) {
    Transport.builder.element('GetPresetTour', nest: () {
      Transport.builder.namespace(Xmlns.tptz);

      ReferenceToken(profileToken).buildXml(Transport.builder);

      ReferenceToken(presetTourToken).buildXml(
        Transport.builder,
        tag: 'PresetTourToken',
      );
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [getPresetTours], requires a [profileToken]
  static XmlDocumentFragment getPresetTours(String profileToken) {
    Transport.builder.element('GetPresetTours', nest: () {
      Transport.builder.namespace(Xmlns.tptz);

      ReferenceToken(profileToken).buildXml(Transport.builder);
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [getServiceCapabilities]
  static XmlDocumentFragment getServiceCapabilities() =>
      Transport.quickTag('GetServiceCapabilities', Xmlns.tptz);

  /// XML for the [getStatus], requires a [profileToken]
  static XmlDocumentFragment getStatus(String profileToken) {
    Transport.builder.element('GetStatus', nest: () {
      Transport.builder.namespace(Xmlns.tptz);

      ReferenceToken(profileToken).buildXml(Transport.builder);
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [gotoHomePosition], requires a [profileToken] and optionally [PtzSpeed]
  static XmlDocumentFragment gotoHomePosition(
      String profileToken, PtzSpeed? speed) {
    Transport.builder.element('GotoHomePosition', nest: () {
      Transport.builder.namespace(Xmlns.tptz);

      ReferenceToken(profileToken).buildXml(Transport.builder);

      speed?.buildXml(
        Transport.builder,
        tag: 'Speed',
        namespace: Xmlns.tptz,
      );
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [gotoPreset], requires a [profileToken], [presetToken] and optionally [PtzSpeed]
  static XmlDocumentFragment gotoPreset(
      String profileToken, String presetToken, PtzSpeed? speed) {
    Transport.builder.element('GotoPreset', nest: () {
      Transport.builder.namespace(Xmlns.tptz);

      ReferenceToken(profileToken).buildXml(Transport.builder);

      ReferenceToken(presetToken).buildXml(
        Transport.builder,
        tag: 'PresetToken',
      );

      speed?.buildXml(
        Transport.builder,
        tag: 'Speed',
        namespace: Xmlns.tptz,
      );
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [relativeMove], requires a [profileToken] and [PtzVector]
  static XmlDocumentFragment relativeMove(
      String profileToken, PtzVector translation, PtzSpeed? speed) {
    Transport.builder.element('RelativeMove', nest: () {
      Transport.builder.namespace(Xmlns.tptz); //tptz

      ReferenceToken(profileToken).buildXml(Transport.builder);

      translation.buildXml(
        Transport.builder,
        tag: 'Translation',
        namespace: Xmlns.tptz,
      );

      speed?.buildXml(
        Transport.builder,
        tag: 'Speed',
        namespace: Xmlns.tptz,
      );
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [removePreset], requires a [profileToken] and [Preset]
  static XmlDocumentFragment removePreset(String profileToken,
      {required Preset preset}) {
    Transport.builder.element('RemovePreset', nest: () {
      Transport.builder.namespace(Xmlns.tptz);

      ReferenceToken(profileToken).buildXml(Transport.builder);

      preset.referenceToken.buildXml(Transport.builder, tag: 'PresetToken');
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [removePresetTour], requires a [profileToken] and [presetTour]
  static XmlDocumentFragment removePresetTour(String profileToken,
      {required PresetTour presetTour}) {
    Transport.builder.element('RemovePresetTour', nest: () {
      Transport.builder.namespace(Xmlns.tptz);

      ReferenceToken(profileToken).buildXml(Transport.builder);

      presetTour.referenceToken.buildXml(
        Transport.builder,
        tag: 'PresetTourToken',
      );
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [setHomePosition], requires a [profileToken]
  static XmlDocumentFragment setHomePosition(String profileToken) {
    Transport.builder.element('SetHomePosition', nest: () {
      Transport.builder.namespace(Xmlns.tptz);

      ReferenceToken(profileToken).buildXml(Transport.builder);
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [setPreset], requires a [profileToken] and optionally
  /// [presetName] and/or [presetToken]
  static XmlDocumentFragment setPreset(String profileToken,
      {String? presetName, String? presetToken}) {
    Transport.builder.element('SetPreset', nest: () {
      Transport.builder.namespace(Xmlns.tptz);

      ReferenceToken(profileToken).buildXml(Transport.builder);

      if (presetName != null) {
        Transport.builder.element('PresetName', nest: () {
          Transport.builder.namespace(Xmlns.tptz);
          Transport.builder.text(presetName);
        });
      }

      if (presetToken != null) {
        Transport.builder.element('PresetToken', nest: () {
          Transport.builder.namespace(Xmlns.tptz);
          Transport.builder.text(presetToken);
        });
      }
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [stop], requires a [profileToken] and optionally [panTilt]
  /// and/or [zoom]
  static XmlDocumentFragment stop(String profileToken,
      {bool panTilt = false, bool zoom = false}) {
    Transport.builder.element('Stop', nest: () {
      Transport.builder.namespace(Xmlns.tptz); //tptz

      ReferenceToken(profileToken).buildXml(Transport.builder);

      Transport.builder.element('PanTilt', nest: () {
        Transport.builder.namespace(Xmlns.tt);
        Transport.builder.text('$panTilt');
      });

      Transport.builder.element('Zoom', nest: () {
        Transport.builder.namespace(Xmlns.tt);
        Transport.builder.text('$zoom');
      });
    });

    return Transport.builder.buildFragment();
  }
}
