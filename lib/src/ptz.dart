import 'package:easy_onvif/ptz.dart';
import 'package:easy_onvif/shared.dart';
import 'package:easy_onvif/soap.dart' as soap;
import 'package:loggy/loggy.dart';

class Ptz with UiLoggy {
  final soap.Transport transport;

  final Uri uri;

  final configurationCache = <String, PtzConfiguration>{};

  PanTiltLimits? defaultPanTiltLimits;
  PtzSpeed? defaultSpeed;
  ZoomLimits? defaultZoomLimits;

  Ptz({
    required this.transport,
    required this.uri,
  });

  /// Operation to move pan,tilt or zoom to a absolute destination.
  ///
  /// The speed argument is optional. If an x/y speed value is given it is up to
  /// the device to either use the x value as absolute resulting speed vector or
  /// to map x and y to the component speed. If the speed argument is omitted,
  /// the default speed set by the [PtzConfiguration] will be used.
  Future<bool> absoluteMove(String profileToken, PtzPosition place,
      [PtzPosition? speed]) async {
    loggy.debug('absoluteMove');

    final envelope = await transport.sendRequest(
        uri,
        transport.securedEnvelope(
            soap.PtzRequest.absoluteMove(profileToken, place, speed)));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return true;
  }

  /// Operation for continuous Pan/Tilt and Zoom movements. The operation is
  /// supported if the PTZNode supports at least one continuous Pan/Tilt or Zoom
  /// space. If the space argument is omitted, the default space set by the
  /// [PtzConfiguration] will be used.
  Future<bool> continuousMove(String profileToken, PtzPosition velocity,
      [int? timeout]) async {
    loggy.debug('continuousMove');

    final envelope = await transport.sendRequest(
        uri,
        transport.securedEnvelope(soap.PtzRequest.continuousMove(profileToken,
            velocity: velocity, timeout: timeout)));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return true;
  }

  /// Operation to get all available PTZConfigurations that can be added to the
  /// referenced media profile.
  /// A device providing more than one PTZConfiguration or more than one
  /// [VideoSourceConfiguration] or which has any other resource interdependency
  /// between [PtzConfiguration] entities and other resources listable in a
  /// media profile should implement this operation. PTZConfiguration entities
  /// returned by this operation shall not fail on adding them to the referenced
  /// media profile.
  Future<List<PtzConfiguration>> getCompatibleConfigurations(
      String profileToken) async {
    loggy.debug('getCompatibleConfigurations');

    final envelope = await transport.sendRequest(
        uri,
        transport.securedEnvelope(
            soap.PtzRequest.getCompatibleConfigurations(profileToken)));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return GetCompatibleConfigurationsResponse.fromJson(envelope.body.response!)
        .ptzConfigurations;
  }

  /// Get a specific PTZconfiguration from the device, identified by its reference token or name.
  ///
  /// The default Position/Translation/Velocity Spaces are introduced to allow
  /// NVCs sending move requests without the need to specify a certain
  /// coordinate system. The default Speeds are introduced to control the speed
  /// of move requests (absolute, relative, preset), where no explicit speed has
  /// been set.
  ///
  /// The allowed pan and tilt range for Pan/Tilt Limits is defined by a
  /// two-dimensional space range that is mapped to a specific Absolute Pan/Tilt
  /// Position Space. At least one Pan/Tilt Position Space is required by the
  /// PTZNode to support Pan/Tilt limits. The limits apply to all supported
  /// absolute, relative and continuous Pan/Tilt movements. The limits shall be
  /// checked within the coordinate system for which the limits have been
  /// specified. That means that even if movements are specified in a different
  /// coordinate system, the requested movements shall be transformed to the
  /// coordinate system of the limits where the limits can be checked. When a
  /// relative or continuous movements is specified, which would leave the
  /// specified limits, the PTZ unit has to move along the specified limits. The
  /// Zoom Limits have to be interpreted accordingly.
  Future<PtzConfiguration> getConfiguration(String referenceToken) async {
    loggy.debug('getConfiguration');

    final envelope = await transport.sendRequest(
        uri,
        transport
            .securedEnvelope(soap.PtzRequest.getConfiguration(referenceToken)));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return GetConfigurationResponse.fromJson(envelope.body.response!)
        .ptzConfiguration;
  }

  /// List supported coordinate systems including their range limitations.
  /// Therefore, the options MAY differ depending on whether the PTZ
  /// Configuration is assigned to a Profile containing a Video Source
  /// Configuration. In that case, the options may additionally contain
  /// coordinate systems referring to the image coordinate system described by
  /// the Video Source Configuration. If the PTZ Node supports continuous
  /// movements, it shall return a Timeout Range within which Timeouts are
  /// accepted by the PTZ Node.
  Future<PtzConfigurationOptions> getConfigurationOptions(
      String configurationToken) async {
    loggy.debug('getConfigurationOptions');

    final envelope = await transport.sendRequest(
        uri,
        transport.securedEnvelope(
            soap.PtzRequest.getConfigurationOptions(configurationToken)));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return GetConfigurationOptionsResponse.fromJson(envelope.body.response!)
        .ptzConfigurationOptions;
  }

  /// Get all the existing PTZConfigurations from the device.
  ///
  /// The default Position/Translation/Velocity Spaces are introduced to allow
  /// NVCs sending move requests without the need to specify a certain
  /// coordinate system. The default Speeds are introduced to control the speed
  /// of move requests (absolute, relative, preset), where no explicit speed has
  /// been set.
  ///
  /// The allowed pan and tilt range for Pan/Tilt Limits is defined by a
  /// two-dimensional space range that is mapped to a specific Absolute Pan/Tilt
  /// Position Space. At least one Pan/Tilt Position Space is required by the
  /// PTZNode to support Pan/Tilt limits. The limits apply to all supported
  /// absolute, relative and continuous Pan/Tilt movements. The limits shall be
  /// checked within the coordinate system for which the limits have been
  /// specified. That means that even if movements are specified in a different
  /// coordinate system, the requested movements shall be transformed to the
  /// coordinate system of the limits where the limits can be checked. When a
  /// relative or continuous movements is specified, which would leave the
  /// specified limits, the PTZ unit has to move along the specified limits. The
  /// Zoom Limits have to be interpreted accordingly.
  Future<List<PtzConfiguration>> getConfigurations() async {
    loggy.debug('getConfigurations');

    final envelope = await transport.sendRequest(
        uri, transport.securedEnvelope(soap.PtzRequest.getConfigurations()));

    if (envelope.body.response == null) throw Exception();

    final ptzConfigurations =
        GetConfigurationsResponse.fromJson(envelope.body.response!)
            .ptzConfigurations;

    _clearDefaults();

    for (var ptzConfiguration in ptzConfigurations) {
      defaultSpeed ??= ptzConfiguration.defaultPtzSpeed;

      defaultPanTiltLimits ??= ptzConfiguration.panTiltLimits;

      defaultZoomLimits ??= ptzConfiguration.zoomLimits;

      configurationCache[ptzConfiguration.token] = ptzConfiguration;
    }

    return ptzConfigurations;
  }

  /// Operation to request all PTZ presets for the [Preset] in the selected
  /// profile. The operation is supported if there is support for at least one
  /// PTZ preset by the [Preset].
  Future<List<Preset>> getPresets(String profileToken,
      {int? limit = 100}) async {
    loggy.debug('getPresets');

    final envelope = await transport.sendRequest(uri,
        transport.securedEnvelope(soap.PtzRequest.getPresets(profileToken)));

    if (envelope.body.response == null) throw Exception();

    final presets =
        GetPresetsResponse.fromJson(envelope.body.response!).presets;

    limit = (limit! > presets.length) ? presets.length : limit;

    return GetPresetsResponse.fromJson(envelope.body.response!)
        .presets
        .sublist(0, limit);
  }

  Future<PresetTour> getPresetTour(
    String profileToken, {
    required String presetTourToken,
  }) async {
    loggy.debug('getPresetTour');

    final envelope = await transport.sendRequest(
        uri,
        transport.securedEnvelope(soap.PtzRequest.getPresetTour(
          profileToken,
          presetTourToken: presetTourToken,
        )));

    if (envelope.body.response == null) throw Exception();

    return GetPresetTourResponse.fromJson(envelope.body.response!).presetTour;
  }

  Future<List<PresetTour>> getPresetTours(String profileToken) async {
    loggy.debug('getPresetTours');

    final envelope = await transport.sendRequest(
        uri,
        transport
            .securedEnvelope(soap.PtzRequest.getPresetTours(profileToken)));

    if (envelope.body.response == null) throw Exception();

    return GetPresetToursResponse.fromJson(envelope.body.response!).presetTours;
  }

  Future<Map<String, Preset>> getPresetsMap(String profileToken) async {
    loggy.debug('getPresetsMap');

    return {
      for (var preset in await getPresets(profileToken)) preset.token: preset
    };
  }

  /// Returns the capabilities of the PTZ service. The result is returned in a
  /// typed answer.
  Future<Capabilities> getServiceCapabilities() async {
    loggy.debug('getServiceCapabilities');

    final envelope = await transport.sendRequest(uri,
        transport.securedEnvelope(soap.PtzRequest.getServiceCapabilities()));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return GetServiceCapabilitiesResponse.fromJson(envelope.body.response!)
        .capabilities;
  }

  /// Operation to request PTZ status for the Node in the selected profile.
  Future<PtzStatus> getStatus(String profileToken) async {
    loggy.debug('getStatus');

    final envelope = await transport.sendRequest(uri,
        transport.securedEnvelope(soap.PtzRequest.getStatus(profileToken)));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return GetStatusResponse.fromJson(envelope.body.response!).ptzStatus;
  }

  /// Operation to move the PTZ device to it's "home" position. The operation is
  /// supported if the HomeSupported element in the PTZNode is true.
  Future<bool> gotoHomePosition(String profileToken, [PtzSpeed? speed]) async {
    loggy.debug('gotoHomePosition');

    final envelope = await transport.sendRequest(
        uri,
        transport.securedEnvelope(
            soap.PtzRequest.gotoHomePosition(profileToken, speed)));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return true;
  }

  /// Operation to go to a saved preset position for the [Preset] in the
  /// selected profile. The operation is supported if there is support for at
  /// least one PTZ preset by the [Preset].
  Future<bool> gotoPreset(
    String profileToken, {
    required String presetToken,
    PtzSpeed? speed,
  }) async {
    loggy.debug('gotoPreset');

    final envelope = await transport.sendRequest(
        uri,
        transport.securedEnvelope(
            soap.PtzRequest.gotoPreset(profileToken, presetToken, speed)));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return true;
  }

  Future<void> move(String profileToken, PanTilt direction,
      [Zoom? zoom]) async {
    loggy.debug('move');

    Zoom zoomAdjust = zoom ?? Zoom(x: 0);

    try {
      await relativeMove(
          profileToken, PtzPosition(panTilt: direction, zoom: zoomAdjust));
    } catch (err) {
      PanTilt? panTilt;

      loggy.error('Relative move failed');

      loggy.error(err);

      loggy.error('Attempting workaround with AbsoluteMove');

      final ptzStatus = await getStatus(profileToken);

      if (ptzStatus.position.panTilt != null) {
        panTilt = PanTilt(
            x: ptzStatus.position.panTilt!.x + direction.x,
            y: ptzStatus.position.panTilt!.y + direction.y);
      } else {
        panTilt = PanTilt(x: 0, y: 0);
      }

      if (ptzStatus.position.zoom != null) {
        zoomAdjust = Zoom(x: ptzStatus.position.zoom!.x + zoomAdjust.x);
      }

      await absoluteMove(
          profileToken, PtzPosition(panTilt: panTilt, zoom: zoomAdjust));
    }
  }

  /// A helper method to perform a single [step] of a [relativeMove] on the
  /// negative y axis (down)
  Future<void> moveDown(String profileToken, [int step = 25]) async {
    loggy.debug('moveDown');

    await move(profileToken, PanTilt.fromInt(y: 0 - step, x: 0));
  }

  /// A helper method to perform a single [step] of a [relativeMove] on the
  /// negative x axis (left)
  Future<void> moveLeft(String profileToken, [int step = 25]) async {
    loggy.debug('moveLeft');

    await move(profileToken, PanTilt.fromInt(x: 0 - step, y: 0));
  }

  /// A helper method to perform a single [step] of a [relativeMove] on the
  /// positive x axis (right)
  Future<void> moveRight(String profileToken, [int step = 25]) async {
    loggy.debug('moveRight');

    await move(profileToken, PanTilt.fromInt(x: step, y: 0));
  }

  /// A helper method to perform a single [step] of a [relativeMove] on the
  /// positive y axis (up)
  Future<void> moveUp(String profileToken, [int step = 25]) async {
    loggy.debug('moveUp');

    await move(profileToken, PanTilt.fromInt(y: step, x: 0));
  }

  /// Operation for Relative Pan/Tilt and Zoom Move. The operation is supported
  /// if the PTZNode supports at least one relative Pan/Tilt or Zoom space.
  ///
  /// The speed argument is optional. If an x/y speed value is given it is up to
  /// the device to either use the x value as absolute resulting speed vector or
  /// to map x and y to the component speed. If the speed argument is omitted,
  /// the default speed set by the [PtzConfiguration] will be used.
  Future<bool> relativeMove(String profileToken, PtzPosition move) async {
    loggy.debug('relativeMove');

    final envelope = await transport.sendRequest(
        uri,
        transport
            .securedEnvelope(soap.PtzRequest.relativeMove(profileToken, move)));

    return envelope.body.response?.containsKey('RelativeMoveResponse') ?? false;
  }

  /// Operation to remove a PTZ preset for the Node in the selected profile. The
  /// operation is supported if the PresetPosition capability exists for the Node
  /// in the selected profile.
  Future<bool> removePreset(String profileToken,
      {required Preset preset}) async {
    loggy.debug('removePreset');

    final envelope = await transport.sendRequest(
        uri,
        transport.securedEnvelope(
            soap.PtzRequest.removePreset(profileToken, preset: preset)));

    return envelope.body.response?.containsKey('RemovePresetResponse') ?? false;
  }

  /// Operation to save current position as the home position. The
  /// SetHomePosition command returns with a failure if the “home” position is
  /// fixed and cannot be overwritten. If the SetHomePosition is successful, it
  /// is possible to recall the Home Position with the GotoHomePosition command.
  Future<bool> setHomePosition(String profileToken) async {
    loggy.debug('setHomePosition');

    final envelope = await transport.sendRequest(
        uri,
        transport
            .securedEnvelope(soap.PtzRequest.setHomePosition(profileToken)));

    return envelope.body.response?.containsKey('SetHomePositionResponse') ??
        false;
  }

  /// The [setPreset] command saves the current device position parameters so
  /// that the device can move to the saved preset position through the
  /// [gotoPreset] operation. In order to create a new [Preset], the
  /// SetPresetRequest contains no PresetToken. If creation is successful, the
  /// Response contains the PresetToken which uniquely identifies the Preset. An
  /// existing [Preset] can be overwritten by specifying the PresetToken of the
  /// corresponding [Preset]. In both cases (overwriting or creation) an
  /// optional PresetName can be specified. The operation fails if the PTZ
  /// device is moving during the [setPreset] operation. The device may
  /// internally save additional states such as imaging properties in the PTZ
  /// Preset which then should be recalled in the [gotoPreset] operation.
  Future<String> setPreset(
    String profileToken, {
    String? presetName,
    String? presetToken,
  }) async {
    loggy.debug('setPreset');

    final envelope = await transport.sendRequest(
      uri,
      transport.securedEnvelope(soap.PtzRequest.setPreset(profileToken,
          presetName: presetName, presetToken: presetToken)),
    );

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return SetPresetResponse.fromJson(envelope.body.response!).presetToken;
  }

  /// Operation to stop ongoing pan, tilt and zoom movements of absolute
  /// relative and continuous type. If no stop argument for pan, tilt or zoom is
  /// set, the device will stop all ongoing pan, tilt and zoom movements.
  Future<bool> stop(String profileToken,
      {bool panTilt = true, bool zoom = true}) async {
    loggy.debug('stop');

    final envelope = await transport.sendRequest(
        uri,
        transport.securedEnvelope(
            soap.PtzRequest.stop(profileToken, panTilt: panTilt, zoom: zoom)));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return envelope.body.response?.containsKey('StopResponse') ?? false;
  }

  Future<void> zoom(String profileToken, Zoom zoom) async {
    loggy.debug('zoom');

    await move(profileToken, PanTilt(y: 0, x: 0), zoom);
  }

  /// A helper method to perform a single [step] of a [relativeMove] on the
  /// positive z axis (closer)
  Future<void> zoomIn(String profileToken, [int step = 25]) async {
    loggy.debug('zoomIn');

    await zoom(profileToken, Zoom.fromInt(x: step));
  }

  /// A helper method to perform a single [step] of a [relativeMove] on the
  /// negative y axis (farther)
  Future<void> zoomOut(String profileToken, [int step = 25]) async {
    loggy.debug('zoomOut');

    await zoom(profileToken, Zoom.fromInt(x: 0 - step));
  }

  void _clearDefaults() {
    defaultSpeed = null;

    defaultPanTiltLimits = null;

    defaultZoomLimits = null;
  }

  Future<Preset?> getCurrentPreset(String profileToken) async {
    loggy.debug('getCurrentPreset');

    Preset? matchedPreset;

    final ptzStatus = await getStatus(profileToken);

    final presets = await getPresets(profileToken);

    for (var preset in presets) {
      if (_matchPositionSettings(preset, ptzStatus)) {
        matchedPreset = preset;

        break;
      }
    }

    return matchedPreset;
  }

  bool _matchValue(num right, num left) {
    return (right - left).abs() < 0.005 ||
        (right - (left > 0 ? left - 1 : left)).abs() < 0.0005;
  }

  bool _matchPositionSettings(Preset preset, PtzStatus ptzStatus) {
    bool matchX =
        _matchValue(preset.position.panTilt!.x, ptzStatus.position.panTilt!.x);

    bool matchY =
        _matchValue(preset.position.panTilt!.y, ptzStatus.position.panTilt!.y);

    bool matchZ =
        _matchValue(preset.position.zoom!.x, ptzStatus.position.zoom!.x);

    return matchX && matchY && matchZ;
  }

  static List<PtzConfiguration> ptzConfigurationConverter(dynamic json) {
    if (json == null) {
      return <PtzConfiguration>[];
    } else if (json is List) {
      return json
          .map((e) => PtzConfiguration.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    return [PtzConfiguration.fromJson(json as Map<String, dynamic>)];
  }
}
