import 'package:easy_onvif/model/pan_tilt_limits.dart';
import 'package:easy_onvif/model/ptz_configuration.dart';
import 'package:easy_onvif/model/ptz_speed.dart';
import 'package:easy_onvif/model/zoom_limits.dart';
import 'package:easy_onvif/onvif.dart';

class Ptz {
  final Onvif onvif;

  final String uri;

  final configurationCache = <String, PtzConfiguration>{};

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

  Future<List<PtzConfiguration>> getCompatibleConfigurations(
      String profileToken) async {
    final envelope = await Soap.retrieveEnvlope(
        uri,
        onvif.secureRequest(
            SoapRequest.getCompatibleConfigurations(profileToken)));

    if (envelope.body.compatibleConfigurationsResponse == null) {
      throw Exception();
    }

    return envelope.body.compatibleConfigurationsResponse!.ptzConfigurations;
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

    for (var ptzConfiguration in ptzConfigs) {
      defaultSpeed ??= ptzConfiguration.defaultPtzSpeed;

      defaultPanTiltLimits ??= ptzConfiguration.panTiltLimits;

      defaultZoomLimits ??= ptzConfiguration.zoomLimits;

      configurationCache[ptzConfiguration.token] = ptzConfiguration;
    }

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
  Future<PtzConfiguration> getConfiguration(
      String ptzConfigurationToken) async {
    final envelope = await Soap.retrieveEnvlope(
        uri,
        onvif.secureRequest(
            SoapRequest.getPtzConfiguration(ptzConfigurationToken)));

    if (envelope.body.configurationResponse == null) throw Exception();

    final ptzConfiguration =
        envelope.body.configurationResponse!.ptzConfiguration;

    configurationCache[ptzConfigurationToken] = ptzConfiguration;

    return ptzConfiguration;
  }

  ///Operation to request all PTZ presets for the [Preset] in the selected
  ///profile. The operation is supported if there is support for at least one
  ///PTZ preset by the [Preset].
  Future<List<Preset>> getPresets(String profileToken,
      {int limit = 100}) async {
    final envelope = await Soap.retrieveEnvlope(
        uri, onvif.secureRequest(SoapRequest.presets(profileToken)));

    if (envelope.body.getPresetResponse == null) throw Exception();

    return envelope.body.getPresetResponse!.presets.sublist(0, limit);
  }

  Future<Map<String, Preset>> getPresetsMap(String profileToken) async {
    return {
      for (var preset in await getPresets(profileToken)) preset.token: preset
    };
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

  Future<void> move(String profileToken, PanTilt direction) async {
    await relativeMove(
        profileToken, PtzPosition(panTilt: direction, zoom: Zoom(x: 0)));
  }

  ///A helper method to perform a single [step] of a [relativeMove] on the
  ///negative y axis (down)
  Future<void> moveDown(String profileToken, [int step = 25]) async {
    await move(profileToken, PanTilt.fromInt(y: 0 - step, x: 0));
  }

  ///A helper method to perform a single [step] of a [relativeMove] on the
  ///negative x axis (left)
  Future<void> moveLeft(String profileToken, [int step = 25]) async {
    await move(profileToken, PanTilt.fromInt(x: 0 - step, y: 0));
  }

  ///A helper method to perform a single [step] of a [relativeMove] on the
  ///positive x axis (right)
  Future<void> moveRight(String profileToken, [int step = 25]) async {
    await move(profileToken, PanTilt.fromInt(x: step, y: 0));
  }

  ///A helper method to perform a single [step] of a [relativeMove] on the
  ///positive y axis (up)
  Future<void> moveUp(String profileToken, [int step = 25]) async {
    await move(profileToken, PanTilt.fromInt(y: step, x: 0));
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
  Future<String> setPreset(String profileToken,
      [String? name, String? token]) async {
    final envelope = await Soap.retrieveEnvlope(
      uri,
      onvif.secureRequest(SoapRequest.setPreset(profileToken, name, token)),
    );

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

  //   Future<void> move(String profileToken, PanTilt direction,
  //     [double step = 0.01]) async {
  //   await relativeMove(profileToken,
  //       PtzPosition(panTilt: direction, zoom: Zoom.fromDouble(0)));
  // }

  Future<void> zoom(String profileToken, Zoom zoom) async {
    await relativeMove(
        profileToken, PtzPosition(panTilt: PanTilt(y: 0, x: 0), zoom: zoom));
  }

  ///A helper method to perform a single [step] of a [relativeMove] on the
  ///positive z axis (closer)
  Future<void> zoomIn(String profileToken, [int step = 25]) async {
    await zoom(profileToken, Zoom.fromInt(x: step));
  }

  ///A helper method to perform a single [step] of a [relativeMove] on the
  ///negative y axis (farther)
  Future<void> zoomOut(String profileToken, [int step = 25]) async {
    await zoom(profileToken, Zoom.fromInt(x: 0 - step));
  }

  void _clearDefaults() {
    defaultSpeed = null;

    defaultPanTiltLimits = null;

    defaultZoomLimits = null;
  }

  Future<Preset?> getCurrentPreset(String profileToken) async {
    Preset? matchedPreset;

    final _ptzStatus = await getStatus(profileToken);

    final _presets = await getPresets(profileToken);

    for (var preset in _presets) {
      if (_matchPositionSettings(preset, _ptzStatus)) {
        matchedPreset = preset;

        break;
      }
    }

    return matchedPreset;
  }

  bool _matchValue(double right, double left) {
    return (right - left).abs() < 0.005 ||
        (right - (left > 0 ? left - 1 : left)).abs() < 0.0005;
  }

  bool _matchPositionSettings(Preset preset, PtzStatus ptzStatus) {
    bool _matchX =
        _matchValue(preset.position.panTilt!.x, ptzStatus.position.panTilt!.x);

    bool _matchY =
        _matchValue(preset.position.panTilt!.y, ptzStatus.position.panTilt!.y);

    bool _matchZ =
        _matchValue(preset.position.zoom!.x, ptzStatus.position.zoom!.x);

    return _matchX && _matchY && _matchZ;
  }

  static List<PtzConfiguration> ptzConfigurationConverter(dynamic json) {
    if (json is List) {
      return json
          .map((e) => PtzConfiguration.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    return [PtzConfiguration.fromJson(json as Map<String, dynamic>)];
  }
}
