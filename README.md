# ONVIF Client protocol Profile S (Live Streaming) Dart implementation

This is a wrapper to ONVIF protocol which allows you to get information about your NVT (network video transmitter) device, its media sources, control PTZ (pan-tilt-zoom) movements and manage presets. It will also allow you to get information about your NVR (network video recorder).

[![pub package](https://img.shields.io/pub/v/easy_onvif.svg)](https://pub.dartlang.org/packages/easy_onvif)
[![Build Status](https://github.com/faithoflifedev/easy_onvif/workflows/Dart/badge.svg)](https://github.com/faithoflifedev/easy_onvif/actions)

## New for version 1.0.7

This release has logging capabilities through use of the [loggy](https://pub.dev/packages/loggy) package for Dart code and the [flutter_loggy](https://pub.dev/packages/flutter_loggy) package for Flutter code. The code includes both a [Dart example](https://pub.dev/packages/easy_onvif/example) and a [Flutter example](https://github.com/faithoflifedev/easy_onvif/tree/main/example/flutter_model) that demonstreate usage.  By default the logging level is set to `LogLevel.error`, which only logs exceptions.

## New for version 1.0.0

As of the 1.0.0 release of this package, there is a cli utility included that can be used to return data for any API call currently supported by the package. If you want to get started quicky with the cli utility run these commands in a termainal session:

```sh
pub global activate easy_onvif

onvif --help
```

Please see the cli documentation [README.md](https://github.com/faithoflifedev/easy_onvif/tree/main/bin) for more detailed usage information.

## Getting Started

To use this package in your code, first add the dependency to your project:

```yml
dependencies:
  ...
  easy_onvif: ^1.0.7
```

If you need additional help getting started with dart, check out these [guides](https://dart.dev/guides).

## Usage Example

Import the easy_onvif library.

```dart
import 'package:easy_onvif/onvif.dart';
```

## Connecting to an Onvif device

```dart
final onvif = await Onvif.connect(
 host: [hostname or ipaddress],
 username: [username],
 password: [password]);
```

## Interacting with the device through Onvif operations

Refer to the tables below for the supported operations.

Through the `deviceManagement` operations you can get information about the connected device.

```dart
var deviceInfo = await onvif.deviceManagement.getDeviceInformation();

print(deviceInfo.model);
```

Many operations require you to supply a `profileToken` which can be retrieved through `media` operations.

```dart
var profiles = await onvif.media.getProfiles();

profiles.forEach((element) {
 print(element.name + ' ' + element.token);
});

var profileToken = profiles[0].token;
```

With the `ptz` operations you can get a list of camera presets from the connected device.

```dart
var presets = await onvif.ptz.getPresets(profileToken);

//get a specific preset
var preset = presets[11];

//print the preset values
print(
 'preset: ${preset.position.panTilt?.x}  ${preset.position.panTilt?.y}  ${preset.position.zoom?.x}');

//use the GotoPreset operation to point the camera to the given preset
await onvif.ptz.gotoPreset(profileToken, preset);
```

Be sure to look through the [API Reference](https://pub.dev/documentation/easy_onvif/latest/) for information about the parameters required for the supported Onvif operations.

## Supported Onvif Operations

### [Device Management](https://www.onvif.org/onvif/ver10/device/wsdl/devicemgmt.wsdl)

| Onvif Operation        | Dart Method            | Dart Return Type                       | Test |
| ---------------------- | ---------------------- | -------------------------------------- | ---- |
| CreateUsers            | createUsers            | `Future<void>`                         | [ ]  |
| DeleteUsers            | deleteUsers            | `Future<void>`                         | [ ]  |
| GetCapabilities        | getCapabilities        | `Future<Capabilities>`                 | [x]  |
| GetDeviceInformation   | getDeviceInformation   | `Future<GetDeviceInformationResponse>` | [x]  |
| GetHostname            | getHostname            | `Future<HostnameInformation>`          | [x]  |
| GetNetworkProtocols    | getNetworkProtocols    | `Future<List<NetworkProtocol>>`        | [X]  |
| GetNTP                 | getNtp                 | `Future<NtpInformation>`               | [x]  |
| GetServiceCapabilities | getServiceCapabilities | `Future<DeviceServiceCapabilities>`    | [x]  |
| GetServices            | getServices            | `Future<List<Service>>`                | [x]  |
| GetSystemDateAndTime   | getSystemDateAndTime   | `Future<SystemDateAndTime>`            | [x]  |
| GetSystemUris          | getSystemUris          | `Future<GetSystemUrisResponse>`        | [x]  |
| GetUsers               | getUsers               | `Future<List<User>>`                   | [x]  |

### [Media](https://www.onvif.org/ver10/media/wsdl/media.wsdl)

| Onvif Operation         | Dart Method             | Dart Return Type        | Test |
| ----------------------- | ----------------------- | ----------------------- | ---- |
| GetAudioSources         | getAudioSources         | `Future<AudioSource>`   | [x]  |
| GetProfiles             | getProfiles             | `Future<List<Profile>>` | [x]  |
| GetSnapshotUri          | getSnapshotUri          | `Future<MediaUri>`      | [x]  |
| GetStreamUri            | getStreamUri            | `Future<MediaUri>`      | [x]  |
| GetVideoSources         | getVideoSources         | `Future<VideoSources>`  | [x]  |
| StartMulticastStreaming | startMulticastStreaming | `Future<void>`          | [ ]  |
| StopMulticastStreaming  | stopMulticastStreaming  | `Future<void>`          | [ ]  |

### [PTZ](https://www.onvif.org/ver20/ptz/wsdl/ptz.wsdl)

| Onvif Operation             | Dart Method                 | Dart Return Type                 | Test |
| --------------------------- | --------------------------- | -------------------------------- | ---- |
| AbsoluteMove                | absoluteMove                | `Future<void>`                   | [ ]  |
| ContinuousMove              | continuousMove              | `Future<void>`                   | [ ]  |
| GetCompatibleConfigurations | getCompatibleConfigurations | `Future<List<PtzConfiguration>>` | [x]  |
| GetConfiguration            | getConfiguration            | `Future<PtzConfiguration>`       | [x]  |
| GetConfigurations           | getConfigurations           | `Future<List<PtzConfiguration>>` | [x]  |
| GetPresets                  | getPresets                  | `Future<List<Preset>>`           | [x]  |
| GetStatus                   | getStatus                   | `Future<PtzStatus>`              | [x]  |
| GotoPreset                  | gotoPreset                  | `Future<void>`                   | [ ]  |
| RelativeMove                | relativeMove                | `Future<void>`                   | [ ]  |
| RemovePreset                | removePreset                | `Future<void>`                   | [ ]  |
| SetPreset                   | setPreset                   | `Future<String>`                 | [x]  |
| Stop                        | stop                        | `Future<void>`                   | [ ]  |

### PTZ Helper Methods

| Onvif Operation | Dart Method      | Return Type       |
| --------------- | ---------------- | ----------------- |
| N/A             | move             | `Future<void>`    |
| N/A             | moveDown         | `Future<void>`    |
| N/A             | moveLeft         | `Future<void>`    |
| N/A             | moveRight        | `Future<void>`    |
| N/A             | moveUp           | `Future<void>`    |
| N/A             | zoomIn           | `Future<void>`    |
| N/A             | zoomOut          | `Future<void>`    |
| N/A             | getCurrentPreset | `Future<Preset?>` |

## What's next

- More comprehensive unit tests
- Device discovery is planned for the 1.1.x release of the library.

[![A test image](https://www.buymeacoffee.com/assets/img/guidelines/download-assets-1.svg)](https://www.buymeacoffee.com/faithoflif2)
