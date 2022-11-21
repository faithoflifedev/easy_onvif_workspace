# ONVIF Client protocol Profile S (Live Streaming) Dart implementation

This is a wrapper to ONVIF protocol which allows you to get information about your NVT (network video transmitter) device, its media sources, control PTZ (pan-tilt-zoom) movements and manage presets. It will also allow you to get information about your NVR (network video recorder).

[![pub package](https://img.shields.io/pub/v/easy_onvif.svg)](https://pub.dartlang.org/packages/easy_onvif)
[![Build Status](https://github.com/faithoflifedev/easy_onvif/workflows/Dart/badge.svg)](https://github.com/faithoflifedev/easy_onvif/actions)

## Table of contents
- [New for version 2.0.0](#new-for-version-200)
- [Getting Started](#getting-started)
- [Usage Example](#usage-example)
- [Connecting to an Onvif device](#connecting-to-an-onvif-device)
- [Interacting with the device through Onvif operations](#interacting-with-the-device-through-onvif-operations)
- [Onvif cli (Onvif at the command prompt)](#onvif-cli-onvif-at-the-command-prompt)
- [Supported Onvif Operations](#supported-onvif-operations)
  - [Device Management](#device-management)
  - [Media](#media)
  - [PTZ](#ptz)
  - [PTZ Helper Methods](#ptz-helper-methods)
- [Tested Onvif Devices](#tested-onvif-devices)
- [What's next](#whats-next)

[![Buy me a coffee](https://www.buymeacoffee.com/assets/img/guidelines/download-assets-1.svg)](https://www.buymeacoffee.com/faithoflif2)

## New for version 2.0.0

Device discovery is finally here.  If you're using that cli utilities that became available from v1.0.0, you can discover Onvif devices on your network with the command:

```sh
onvif probe
```

Or, in dart code:

```dart
final multicastProbe = MulticastProbe();

await multicastProbe.probe();

for (var device in multicastProbe.onvifDevices) {
  print(
      '${device.name} ${device.location} ${device.hardware} ${device.xaddr}');
}
```

## Getting Started

To use this package in your code, first add the dependency to your project:

```yml
dependencies:
  ...
  easy_onvif: ^2.0.13+11
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
 host: [hostname or ip address],
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
 print('${element.name}  ${element.token}');
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

## Onvif cli (Onvif at the command prompt)

A command line interface for controlling an Onvif device with cli commands

Install using `dart pub`:

```sh
dart pub global activate easy_onvif
```

Install using `brew`:

```sh
brew tap faithoflifedev/easy_onvif
brew install onvif
```

Run the following command to see help:

```sh
onvif --help
```

Result,

```text
A command line interface for controlling Onvif compliant devices

Usage: onvif <command> [arguments]

Global options:
-h, --help           Print this usage information.
    --config-file    (defaults to "$HOME/.onvif/credentials.json")
    --log-level      [all, debug, info, warning, error, off (default)]

Available commands:
  authorize           Generate an authentication file for an Onvif device
  device-management   Device management commands.
  media               Media commands.
  probe               Probe/device discovery command.
  ptz                 PTZ commands.
  version             Display the package name and version.
```

Please see the cli documentation [README.md](https://github.com/faithoflifedev/easy_onvif/tree/main/bin) for more detailed usage information.

## Supported Onvif Operations

### [Device Management](https://www.onvif.org/onvif/ver10/device/wsdl/devicemgmt.wsdl)

| Onvif Operation        | Dart Method            | Dart Return Type                       | Test |
| ---------------------- | ---------------------- | -------------------------------------- | ---- |
| CreateUsers            | createUsers            | `Future<void>`                         | [ \] |
| DeleteUsers            | deleteUsers            | `Future<void>`                         | [ \] |
| GetCapabilities        | getCapabilities        | `Future<Capabilities>`                 | [x\] |
| GetDiscoveryMode       | getDiscoveryMode       | `Future<String>`                       | [ \] |
| GetDNS                 | getDNS                 | `Future<DnsInformation>`               | [x\] |
| GetDeviceInformation   | getDeviceInformation   | `Future<GetDeviceInformationResponse>` | [x\] |
| GetHostname            | getHostname            | `Future<HostnameInformation>`          | [x\] |
| GetNetworkProtocols    | getNetworkProtocols    | `Future<List<NetworkProtocol>>`        | [x\] |
| GetNTP                 | getNtp                 | `Future<NtpInformation>`               | [x\] |
| GetServiceCapabilities | getServiceCapabilities | `Future<DeviceServiceCapabilities>`    | [x\] |
| GetServices            | getServices            | `Future<List<Service>>`                | [x\] |
| GetSystemDateAndTime   | getSystemDateAndTime   | `Future<SystemDateAndTime>`            | [x\] |
| GetSystemUris          | getSystemUris          | `Future<GetSystemUrisResponse>`        | [x\] |
| GetUsers               | getUsers               | `Future<List<User>>`                   | [x\] |

### [Media](https://www.onvif.org/ver10/media/wsdl/media.wsdl)

| Onvif Operation         | Dart Method             | Dart Return Type        | Test |
| ----------------------- | ----------------------- | ----------------------- | ---- |
| GetAudioSources         | getAudioSources         | `Future<AudioSource>`   | [x\] |
| GetProfiles             | getProfiles             | `Future<List<Profile>>` | [x\] |
| GetSnapshotUri          | getSnapshotUri          | `Future<MediaUri>`      | [x\] |
| GetStreamUri            | getStreamUri            | `Future<MediaUri>`      | [x\] |
| GetVideoSources         | getVideoSources         | `Future<VideoSources>`  | [x\] |
| StartMulticastStreaming | startMulticastStreaming | `Future<void>`          | [ \] |
| StopMulticastStreaming  | stopMulticastStreaming  | `Future<void>`          | [ \] |

### [PTZ](https://www.onvif.org/ver20/ptz/wsdl/ptz.wsdl)

| Onvif Operation             | Dart Method                 | Dart Return Type                 | Test |
| --------------------------- | --------------------------- | -------------------------------- | ---- |
| AbsoluteMove                | absoluteMove                | `Future<bool>`                   | [ \] |
| ContinuousMove              | continuousMove              | `Future<bool>`                   | [x\] |
| GetCompatibleConfigurations | getCompatibleConfigurations | `Future<List<PtzConfiguration>>` | [x\] |
| GetConfiguration            | getConfiguration            | `Future<PtzConfiguration>`       | [x\] |
| GetConfigurations           | getConfigurations           | `Future<List<PtzConfiguration>>` | [x\] |
| GetPresets                  | getPresets                  | `Future<List<Preset>>`           | [x\] |
| GetStatus                   | getStatus                   | `Future<PtzStatus>`              | [x\] |
| GotoHomePosition            | gotoHomePosition            | `Future<bool>`                   | [ \] |
| GotoPreset                  | gotoPreset                  | `Future<bool>`                   | [ \] |
| RelativeMove                | relativeMove                | `Future<void>`                   | [ \] |
| RemovePreset                | removePreset                | `Future<void>`                   | [ \] |
| SetPreset                   | setPreset                   | `Future<String>`                 | [x\] |
| Stop                        | stop                        | `Future<bool>`                   | [x\] |

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

## Tested Onvif Devices

The values returned by the Onvif API `GetDeviceInformation` call.

| Manufacturer       | Model          | Known Issue               |
| ------------------ | -------------- | ------------------------- |
| D-Link Corporation | DCS-6511       |                           |
| Happytimesoft      | IPCamera       |                           |
| ONVIF              | ENP1A14-IR/25X |                           |
| TP-Link            | TL-IPC43AN-4   | RelativeMove&#x00B9;      |
| Unknown            | GX728MF-IR28   |                           |
| TELEKOMSI          | IPC-K22-TSI    |                           |

&#x00B9; For TP-Link, `RelativeMove` is not properly supported on the tested device, however `easy_onvif` falls back to `GetStatus` and `AbsoluteMove` to simulate a relative move.

## What's next

- More comprehensive unit tests
