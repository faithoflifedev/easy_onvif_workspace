import 'package:easy_onvif/ptz.dart';
import 'package:easy_onvif/shared.dart';
import 'package:xml/xml.dart';

import 'transport.dart';
import 'xmlns.dart';

class PtzRequest {
  static XmlDocumentFragment absoluteMove(
      String profileToken, PtzPosition place, PtzPosition? speed) {
    Transport.builder.element('AbsoluteMove', nest: () {
      Transport.builder.namespace(Xmlns.tptz); //tptz
      Transport.builder.element('ProfileToken', nest: () {
        Transport.builder.namespace(Xmlns.tptz);
        Transport.builder.text(profileToken);
      });
      Transport.builder.element('Position', nest: () {
        Transport.builder.namespace(Xmlns.tptz);
        Transport.builder.element('PanTilt', nest: () {
          Transport.builder.namespace(Xmlns.tt);
          Transport.builder.attribute('x', place.panTilt!.x);
          Transport.builder.attribute('y', place.panTilt!.y);
        });
        if (place.zoom != null) {
          Transport.builder.element('Zoom', nest: () {
            Transport.builder.namespace(Xmlns.tt);
            Transport.builder.attribute('x', place.zoom!.x);
          });
        }
      });
      if (speed != null) {
        Transport.builder.element('Speed', nest: () {
          Transport.builder.namespace(Xmlns.tptz);
          if (speed.panTilt != null) {
            Transport.builder.element('PanTilt', nest: () {
              Transport.builder.namespace(Xmlns.tt);
              Transport.builder.attribute('x', speed.panTilt!.x);
              Transport.builder.attribute('y', speed.panTilt!.y);
            });
          }
          if (speed.zoom != null) {
            Transport.builder.element('Zoom', nest: () {
              Transport.builder.namespace(Xmlns.tt);
              Transport.builder.attribute('x', speed.zoom!.x);
            });
          }
        });
      }
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [continuousMove], requires a [profileToken] and [PtzPosition],
  /// and optionally [timeout]
  static XmlDocumentFragment continuousMove(String profileToken,
      {required PtzPosition velocity, int? timeout}) {
    Transport.builder.element('ContinuousMove', nest: () {
      Transport.builder.namespace(Xmlns.tptz); //tptz

      Transport.builder.element('ProfileToken', nest: () {
        Transport.builder.namespace(Xmlns.tptz);
        Transport.builder.text(profileToken);
      });

      Transport.builder.element('Velocity', nest: () {
        Transport.builder.namespace(Xmlns.tptz);

        Transport.builder.element('PanTilt', nest: () {
          Transport.builder.namespace(Xmlns.tt);
          Transport.builder.attribute('x', velocity.panTilt!.x);
          Transport.builder.attribute('y', velocity.panTilt!.y);
        });

        Transport.builder.element('Zoom', nest: () {
          Transport.builder.namespace(Xmlns.tt);

          Transport.builder
              .attribute('x', velocity.zoom != null ? velocity.zoom!.x : 0);
        });
      });

      Transport.builder.element('Timeout', nest: () {
        Transport.builder.namespace(Xmlns.tptz);
        Transport.builder.text('PT${timeout}S');
      });
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [getCompatibleConfigurations], requires a [profileToken]
  static XmlDocumentFragment getCompatibleConfigurations(String profileToken) {
    Transport.builder.element('GetCompatibleConfigurations', nest: () {
      Transport.builder.namespace(Xmlns.tptz);

      Transport.builder.element('ProfileToken', nest: () {
        Transport.builder.namespace(Xmlns.tptz);
        Transport.builder.text(profileToken);
      });
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [getConfiguration], requires a [profileToken]
  static XmlDocumentFragment getConfiguration(String profileToken) {
    Transport.builder.element('GetConfiguration', nest: () {
      Transport.builder.namespace(Xmlns.tptz);

      Transport.builder.element('PTZConfigurationToken', nest: () {
        Transport.builder.namespace(Xmlns.tptz);
        Transport.builder.text(profileToken);
      });
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [getConfigurationOptions], requires a [profileToken]
  static XmlDocumentFragment getConfigurationOptions(String profileToken) {
    Transport.builder.element('GetConfigurationOptions', nest: () {
      Transport.builder.namespace(Xmlns.tptz);

      Transport.builder.element('ConfigurationToken', nest: () {
        Transport.builder.namespace(Xmlns.tptz);
        Transport.builder.text(profileToken);
      });
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [getConfigurations]
  static XmlDocumentFragment getConfigurations() =>
      Transport.quickTag('GetConfigurations', Xmlns.tptz);

  /// XML for the [getPresets], requires a [profileToken]
  static XmlDocumentFragment getPresets(String profileToken) {
    Transport.builder.element('GetPresets', nest: () {
      Transport.builder.namespace(Xmlns.tds);
      Transport.builder.element('ProfileToken', nest: () {
        Transport.builder.text(profileToken);
      });
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [getPresetTour], requires a [profileToken] and [PresetTourToken]
  static XmlDocumentFragment getPresetTour(String profileToken,
      {required String presetTourToken}) {
    Transport.builder.element('GetPresetTour', nest: () {
      Transport.builder.namespace(Xmlns.tptz);
      Transport.builder.element('ProfileToken', nest: () {
        Transport.builder.namespace(Xmlns.tptz);
        Transport.builder.text(profileToken);
      });

      Transport.builder.element('PresetTourToken', nest: () {
        Transport.builder.namespace(Xmlns.tptz);
        Transport.builder.text(presetTourToken);
      });
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [getPresetTours], requires a [profileToken]
  static XmlDocumentFragment getPresetTours(String profileToken) {
    Transport.builder.element('GetPresetTours', nest: () {
      Transport.builder.namespace(Xmlns.tptz);
      Transport.builder.element('ProfileToken', nest: () {
        Transport.builder.namespace(Xmlns.tptz);
        Transport.builder.text(profileToken);
      });
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [getServiceCapabilities]
  static XmlDocumentFragment getServiceCapabilities() =>
      Transport.quickTag('GetServiceCapabilities', Xmlns.tds);

  /// XML for the [getStatus], requires a [profileToken]
  static XmlDocumentFragment getStatus(String profileToken) {
    Transport.builder.element('GetStatus', nest: () {
      Transport.builder.namespace(Xmlns.tptz);
      Transport.builder.element('ProfileToken', nest: () {
        Transport.builder.text(profileToken);
      });
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [gotoHomePosition], requires a [profileToken] and optionally [PtzSpeed]
  static XmlDocumentFragment gotoHomePosition(
      String profileToken, PtzSpeed? speed) {
    Transport.builder.element('GotoHomePosition', nest: () {
      Transport.builder.namespace(Xmlns.tds);
      Transport.builder.element('ProfileToken', nest: () {
        Transport.builder.namespace(Xmlns.tptz);
        Transport.builder.text(profileToken);
      });

      if (speed != null) {
        Transport.builder.element('PanTilt', nest: () {
          Transport.builder.namespace(Xmlns.tt);
          Transport.builder.attribute('x', speed.panTilt!.x);
          Transport.builder.attribute('y', speed.panTilt!.x);
        });

        if (speed.zoom != null) {
          Transport.builder.element('Zoom', nest: () {
            Transport.builder.namespace(Xmlns.tt);
            Transport.builder.attribute('x', speed.zoom!.x);
          });
        }
      }
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [gotoPreset], requires a [profileToken], [presetToken] and optionally [PtzSpeed]
  static XmlDocumentFragment gotoPreset(
      String profileToken, String presetToken, PtzSpeed? speed) {
    Transport.builder.element('GotoPreset', nest: () {
      Transport.builder.namespace(Xmlns.tds);
      Transport.builder.element('ProfileToken', nest: () {
        Transport.builder.namespace(Xmlns.tptz);
        Transport.builder.text(profileToken);
      });
      Transport.builder.element('PresetToken', nest: () {
        Transport.builder.namespace(Xmlns.tptz);
        Transport.builder.text(presetToken);
      });
      Transport.builder.element('Speed', nest: () {
        if (speed != null) {
          Transport.builder.element('PanTilt', nest: () {
            Transport.builder.namespace(Xmlns.tt);
            Transport.builder.attribute('x', speed.panTilt!.x);
            Transport.builder.attribute('y', speed.panTilt!.x);
          });
        }
        if (speed?.zoom != null) {
          Transport.builder.element('Zoom', nest: () {
            Transport.builder.namespace(Xmlns.tt);
            Transport.builder.attribute('x', speed!.zoom!.x);
          });
        }
      });
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [relativeMove], requires a [profileToken] and [PtzPosition]
  static XmlDocumentFragment relativeMove(
      String profileToken, PtzPosition move) {
    Transport.builder.element('RelativeMove', nest: () {
      Transport.builder.namespace(Xmlns.tptz); //tptz
      Transport.builder.element('ProfileToken',
          nest: () => Transport.builder.text(profileToken));
      Transport.builder.element('Translation', nest: () {
        if (move.panTilt != null) {
          Transport.builder.element('PanTilt', nest: () {
            Transport.builder.namespace(Xmlns.tt);
            Transport.builder.attribute('x', move.panTilt!.x);
            Transport.builder.attribute('y', move.panTilt!.y);
          });
        }

        if (move.zoom != null) {
          Transport.builder.element('Zoom', nest: () {
            Transport.builder.namespace(Xmlns.tt);
            Transport.builder.attribute('x', move.zoom!.x);
          });
        }
      });
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [removePreset], requires a [profileToken] and [Preset]
  static XmlDocumentFragment removePreset(String profileToken,
      {required Preset preset}) {
    Transport.builder.element('RemovePreset', nest: () {
      Transport.builder.namespace(Xmlns.tptz);
      Transport.builder.element('ProfileToken', nest: () {
        Transport.builder.namespace(Xmlns.tptz);
        Transport.builder.text(profileToken);
      });
      Transport.builder.element('PresetToken', nest: () {
        Transport.builder.namespace(Xmlns.tptz);
        Transport.builder.text(preset.token);
      });
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [removePresetTour], requires a [profileToken] and [PresetTourToken]
  static XmlDocumentFragment removePresetTour(String profileToken,
      {required PresetTour presetTour}) {
    Transport.builder.element('RemovePresetTour', nest: () {
      Transport.builder.namespace(Xmlns.tptz);
      Transport.builder.element('ProfileToken', nest: () {
        Transport.builder.namespace(Xmlns.tptz);
        Transport.builder.text(profileToken);
      });

      Transport.builder.element('PresetTourToken', nest: () {
        Transport.builder.namespace(Xmlns.tptz);
        Transport.builder.text(presetTour.token);
      });
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [setHomePosition], requires a [profileToken]
  static XmlDocumentFragment setHomePosition(String profileToken) {
    Transport.builder.element('SetHomePosition', nest: () {
      Transport.builder.namespace(Xmlns.tptz);
      Transport.builder.element('ProfileToken', nest: () {
        Transport.builder.text(profileToken);
      });
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [setPreset], requires a [profileToken] and optionally
  /// [presetName] and/or [presetToken]
  static XmlDocumentFragment setPreset(String profileToken,
      {String? presetName, String? presetToken}) {
    Transport.builder.element('SetPreset', nest: () {
      Transport.builder.namespace(Xmlns.tptz);
      Transport.builder.element('ProfileToken', nest: () {
        Transport.builder.namespace(Xmlns.tptz);
        Transport.builder.text(profileToken);
      });

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
      Transport.builder.element('ProfileToken', nest: () {
        Transport.builder.namespace(Xmlns.tptz);
        Transport.builder.text(profileToken);
      });

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
