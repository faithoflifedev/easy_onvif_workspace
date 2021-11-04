import 'package:easy_onvif/model/envelope.dart';
import 'package:easy_onvif/model/panTiltLimits.dart';
import 'package:easy_onvif/model/ptzConfiguration.dart';
import 'package:easy_onvif/model/ptzSpeed.dart';
import 'package:easy_onvif/model/zoomLimits.dart';
import 'package:easy_onvif/onvif.dart';

class Ptz {
  final Onvif onvif;

  final String uri;

  final configurationCache = <String, PtzConfiguration>{};

  bool _hasDefault = false;

  PtzSpeed? defaultSpeed;

  PanTiltLimits? defaultPanTiltLimits;

  ZoomLimits? defaultZoomLimits;

  Ptz({required this.onvif, required this.uri});

  ///Operation to move pan,tilt or zoom to a absolute destination.
  ///
  ///The speed argument is optional. If an x/y speed value is given it is up to
  ///the device to either use the x value as absolute resoluting speed vector or
  ///to map x and y to the component speed. If the speed argument is omitted,
  ///the default speed set by the [PtzConfiguration] will be used.
  Future<void> absoluteMove(String profileToken, PtzPosition place,
      [PtzPosition? speed]) async {
    await Soap.retrieveEnvlope(
        uri,
        onvif.secureRequest(
            SoapRequest.absoluteMove(profileToken, place, speed)));
  }

  ///Operation for continuous Pan/Tilt and Zoom movements. The operation is
  ///supported if the PTZNode supports at least one continuous Pan/Tilt or Zoom
  ///space. If the space argument is omitted, the default space set by the
  ///[PtzConfiguration] will be used.
  Future<void> continuousMove(String profileToken, PtzPosition velocity,
      [int? timeout]) async {
    await Soap.retrieveEnvlope(
        uri,
        onvif.secureRequest(
            SoapRequest.continuousMove(profileToken, velocity, timeout)));
  }

  ///Get all the existing PTZConfigurations from the device.
  ///
  ///The default Position/Translation/Velocity Spaces are introduced to allow
  ///NVCs sending move requests without the need to specify a certain coordinate
  ///system. The default Speeds are introduced to control the speed of move
  ///requests (absolute, relative, preset), where no explicit speed has been
  ///set.
  ///
  ///The allowed pan and tilt range for Pan/Tilt Limits is defined by a
  ///two-dimensional space range that is mapped to a specific Absolute Pan/Tilt
  ///Position Space. At least one Pan/Tilt Position Space is required by the
  ///PTZNode to support Pan/Tilt limits. The limits apply to all supported
  ///absolute, relative and continuous Pan/Tilt movements. The limits shall be
  ///checked within the coordinate system for which the limits have been
  ///specified. That means that even if movements are specified in a different
  ///coordinate system, the requested movements shall be transformed to the
  ///coordinate system of the limits where the limits can be checked. When a
  ///relative or continuous movements is specified, which would leave the
  ///specified limits, the PTZ unit has to move along the specified limits. The
  ///Zoom Limits have to be interpreted accordingly.
  Future<List<PtzConfiguration>> getConfigurations() async {
    final envelope = await Soap.retrieveEnvlope(
        uri, onvif.secureRequest(SoapRequest.getPtzConfigurations()));

    if (envelope.body.configurationsResponse == null) throw Exception();

    final ptzConfigs = envelope.body.configurationsResponse!.ptzConfigurations;

    _clearDefaults();

    ptzConfigs.forEach((element) {
      defaultSpeed ??= element.defaultPTZSpeed;

      defaultPanTiltLimits ??= element.panTiltLimits;

      defaultZoomLimits ??= element.zoomLimits;

      configurationCache[element.token] = element;
    });

    _hasDefault = true;

    return ptzConfigs;
  }

  ///Get a specific PTZconfiguration from the device, identified by its
  ///reference token or name.
  ///
  ///The default Position/Translation/Velocity Spaces are introduced to allow
  ///NVCs sending move requests without the need to specify a certain coordinate
  ///system. The default Speeds are introduced to control the speed of move
  ///requests (absolute, relative, preset), where no explicit speed has been
  ///set.
  ///
  ///The allowed pan and tilt range for Pan/Tilt Limits is defined by a
  ///two-dimensional space range that is mapped to a specific Absolute Pan/Tilt
  ///Position Space. At least one Pan/Tilt Position Space is required by the
  ///PTZNode to support Pan/Tilt limits. The limits apply to all supported
  ///absolute, relative and continuous Pan/Tilt movements. The limits shall be
  ///checked within the coordinate system for which the limits have been
  ///specified. That means that even if movements are specified in a different
  ///coordinate system, the requested movements shall be transformed to the
  ///coordinate system of the limits where the limits can be checked. When a
  ///relative or continuous movements is specified, which would leave the
  ///specified limits, the PTZ unit has to move along the specified limits. The
  ///Zoom Limits have to be interpreted accordingly.
  Future<PtzConfiguration> getConfiguration(String profileToken) async {
    final envelope = await Soap.retrieveEnvlope(uri,
        onvif.secureRequest(SoapRequest.getPtzConfiguration(profileToken)));

    if (envelope.body.configurationResponse == null) throw Exception();

    final ptzConfiguration =
        envelope.body.configurationResponse!.ptzConfiguration;

    configurationCache[profileToken] = ptzConfiguration;

    return ptzConfiguration;
  }

  ///Operation to request all PTZ presets for the [Preset] in the selected
  ///profile. The operation is supported if there is support for at least one
  ///PTZ preset by the [Preset].
  Future<List<Preset>> getPresets(String profileToken) async {
    final envelope = await Soap.retrieveEnvlope(
        uri, onvif.secureRequest(SoapRequest.presets(profileToken)));

    if (envelope.body.getPresetResponse == null) throw Exception();

    return envelope.body.getPresetResponse!.presets;
  }

  ///Operation to go to a saved preset position for the [Preset] in the selected
  ///profile. The operation is supported if there is support for at least on PTZ
  ///preset by the [Preset].
  Future<void> gotoPreset(String profileToken, Preset preset) async {
    await Soap.retrieveEnvlope(
        uri, onvif.secureRequest(SoapRequest.gotoPreset(profileToken, preset)));
  }

  ///Operation to request PTZ status for the Node in the selected profile.
  Future<PtzStatus> getStatus(String profileToken) async {
    final envelope = await Soap.retrieveEnvlope(
        uri, onvif.secureRequest(SoapRequest.status(profileToken)));

    if (envelope.body.statusResponse == null) throw Exception();

    return envelope.body.statusResponse!.ptzStatus;
  }

  Future<void> move(String profileToken, PanTilt direction,
      [int step = 50]) async {
    await continuousMove(profileToken,
        PtzPosition(panTilt: direction, zoom: Zoom.fromDouble(0)));

    await Future.delayed(Duration(milliseconds: step));

    await stop(profileToken);
  }

  ///A helper method to perform a single [step] of a [relativeMove] on the
  ///negative y axis (down)
  Future<void> moveDown(String profileToken, [int step = 50]) async {
    if (!_hasDefault) {
      getConfigurations();
    }

    await move(
        profileToken,
        PanTilt.fromDouble(y: defaultPanTiltLimits!.range.yRange.min, x: 0.0),
        step);
  }

  ///A helper method to perform a single [step] of a [relativeMove] on the
  ///negative x axis (left)
  Future<void> moveLeft(String profileToken, [int step = 50]) async {
    if (!_hasDefault) {
      getConfigurations();
    }

    await move(
        profileToken,
        PanTilt.fromDouble(x: defaultPanTiltLimits!.range.xRange.min, y: 0.0),
        step);
  }

  ///A helper method to perform a single [step] of a [relativeMove] on the
  ///positive x axis (right)
  Future<void> moveRight(String profileToken, [int step = 50]) async {
    if (!_hasDefault) {
      getConfigurations();
    }

    await move(
        profileToken,
        PanTilt.fromDouble(x: defaultPanTiltLimits!.range.xRange.max, y: 0.0),
        step);
  }

  ///A helper method to perform a single [step] of a [relativeMove] on the
  ///positive y axis (up)
  Future<void> moveUp(String profileToken, [int step = 50]) async {
    if (!_hasDefault) {
      getConfigurations();
    }

    await move(
        profileToken,
        PanTilt.fromDouble(y: defaultPanTiltLimits!.range.yRange.max, x: 0.0),
        step);
  }

  ///Operation for Relative Pan/Tilt and Zoom Move. The operation is supported
  ///if the PTZNode supports at least one relative Pan/Tilt or Zoom space.
  ///
  ///The speed argument is optional. If an x/y speed value is given it is up to
  ///the device to either use the x value as absolute resoluting speed vector or
  ///to map x and y to the component speed. If the speed argument is omitted,
  ///the default speed set by the [PtzConfiguration] will be used.
  Future<void> relativeMove(String profileToken, PtzPosition move) async {
    await Soap.retrieveEnvlope(
        uri, onvif.secureRequest(SoapRequest.relativeMove(profileToken, move)));
  }

  ///Operation to remove a PTZ preset for the Node in the selected profile. The
  ///operation is supported if the PresetPosition capability exists for the Node
  ///in the selected profile.
  Future<void> removePreset(String profileToken, Preset preset) async {
    await Soap.retrieveEnvlope(uri,
        onvif.secureRequest(SoapRequest.removePreset(profileToken, preset)));
  }

  ///The [setPreset] command saves the current device position parameters so
  ///that the device can move to the saved preset position through the
  ///[gotoPreset] operation. In order to create a new [Preset], the
  ///SetPresetRequest contains no PresetToken. If creation is successful, the
  ///Response contains the PresetToken which uniquely identifies the Preset. An
  ///existing [Preset] can be overwritten by specifying the PresetToken of the
  ///corresponding [Preset]. In both cases (overwriting or creation) an optional
  ///PresetName can be specified. The operation fails if the PTZ device is
  ///moving during the [setPreset] operation. The device may internally save
  ///additional states such as imaging properties in the PTZ Preset which then
  ///should be recalled in the [gotoPreset] operation.
  Future<String> setPreset(String profileToken, Preset preset) async {
    final envelope = await Soap.retrieveEnvlope(
        uri, onvif.secureRequest(SoapRequest.setPreset(profileToken, preset)),
        postProcess: (String xmlBody, dynamic jsonMap, Envelope envelope) {
      print(xmlBody);
      print('\n\n');
      print(jsonMap);
    });

    if (envelope.body.setPresetResponse == null) throw Exception();

    return envelope.body.setPresetResponse!.presetToken;
  }

  ///Operation to stop ongoing pan, tilt and zoom movements of absolute relative
  ///and continuous type. If no stop argument for pan, tilt or zoom is set, the
  ///device will stop all ongoing pan, tilt and zoom movements.
  Future<void> stop(String profileToken,
      {bool panTilt = true, bool zoom = true}) async {
    await Soap.retrieveEnvlope(
        uri,
        onvif.secureRequest(
            SoapRequest.stop(profileToken, panTilt: panTilt, zoom: zoom)));
  }

  Future<void> _zoom(String profileToken, Zoom zoom, [int step = 100]) async {
    await continuousMove(profileToken,
        PtzPosition(panTilt: PanTilt.fromDouble(y: 0, x: 0), zoom: zoom));

    await Future.delayed(Duration(milliseconds: step));

    await stop(profileToken);
  }

  ///A helper method to perform a single [step] of a [relativeMove] on the
  ///positive z axis (closer)
  Future<void> zoomIn(String profileToken, [int step = 100]) async {
    await _zoom(profileToken, Zoom.fromDouble(0.5), step);
  }

  ///A helper method to perform a single [step] of a [relativeMove] on the
  ///negative y axis (farther)
  Future<void> zoomOut(String profileToken, [int step = 100]) async {
    await _zoom(profileToken, Zoom.fromDouble(-0.5), step);
  }

  void _clearDefaults() {
    defaultSpeed = null;

    defaultPanTiltLimits = null;

    defaultZoomLimits = null;
  }
}
