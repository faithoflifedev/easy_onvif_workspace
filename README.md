# ONVIF Client protocol Profile S (Live Streaming) Dart implementation

This is a wrapper to ONVIF protocol which allows you to get information about your NVT (network video transmitter) device, its media sources, control PTZ (pan-tilt-zoom) movements and manage presets. It will also allow you to get information about your NVR (network video recorder).

[![pub package](https://img.shields.io/pub/v/easy_onvif.svg)](https://pub.dartlang.org/packages/easy_onvif) [![Build Status](https://github.com/faithoflifedev/easy_onvif/workflows/Dart/badge.svg)](https://github.com/faithoflifedev/easy_onvif/actions) [![github last commit](https://shields.io/github/last-commit/faithoflifedev/easy_onvif)](https://shields.io/github/last-commit/faithoflifedev/easy_onvif) [![github build](https://img.shields.io/github/actions/workflow/status/faithoflifedev/easy_onvif/dart.yml?branch=main)](https://shields.io/github/workflow/status/faithoflifedev/easy_onvif/Dart) [![github issues](https://shields.io/github/issues/faithoflifedev/easy_onvif)](https://shields.io/github/issues/faithoflifedev/easy_onvif)

## Table of contents
- [New for version 2.0.0](#new-for-version-200)
- [Getting Started](#getting-started)
  - [Dependency](#dependency)
  - [Usage Example](#usage-example)
  - [Interacting with the device through Onvif operations](#interacting-with-a-device-through-onvif-operations)
- [Lower level requests](#lower-level-requests)
- [Onvif cli (Onvif at the command prompt)](#onvif-cli-onvif-at-the-command-prompt)
- [Supported Onvif Operations](#supported-onvif-operations)
  - [Device Management](#device-management)
  - [Media 1](#media-1)
  - [Media 2](#media-2)
  - [PTZ](#ptz)
  - [PTZ Helper Methods](#ptz-helper-methods)
- [Tested Onvif Devices](#tested-onvif-devices)
- [What's next](#whats-next)
- [Features and bugs](#features-and-bugs)
- [Known Issues](#known-issues)
- [Breaking changes](#breaking-changes)
  - [v2.1.0](#v210)
- [Contributing](#contributing)

[![Buy me a coffee](https://www.buymeacoffee.com/assets/img/guidelines/download-assets-1.svg)](https://www.buymeacoffee.com/faithoflif2)

## New for version 2.1.x

Support for Media2 Onvif operations

```dart
// defaults to Media2, but will fallback to Media1 if Media2 is not supported
var profiles = await onvif.media.getProfiles();

// alternatively, make an explicit call to the Media2 operation
var profiles2 = await onvif.media.media2.getProfiles();
```

## New for version 2.0.x

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
      '${device.name} ${device.location} ${device.hardware} ${device.xAddr}');
}
```

## Getting Started

### Dependency

To use this package in your code, first add the dependency to your project:

```yml
dependencies:
  ...
  easy_onvif: ^2.1.0-dev.1
```

If you need additional help getting started with dart, check out these [guides](https://dart.dev/guides).

### Usage Example

Import the easy_onvif library.

```dart
import 'package:easy_onvif/onvif.dart';

final onvif = await Onvif.connect(
 host: [hostname or ip address],
 username: [username],
 password: [password]);
```

### Interacting with a device through Onvif operations

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

## Lower level requests

In cases where there is no helper method for a specific Onvif operation, a low-level call can be used to make the request to the device.  The code below performs the `GetAudioOutputs` Media1 operation.  All responses take the form of a hashmap `Map<String,dynamic>`.

```dart
// sample low level request
//
// build a xml fragment for the specific Onvif operation
Transport.builder.element('GetAudioOutputs', nest: () {
  Transport.builder.namespace(Xmlns.trt);
});

final requestFragment = Transport.builder.buildFragment();

// using the connected onvif object from the earlier example
final transport = onvif.transport;

// build the soap request envelope and send the request
// since this is a media1 request, send to the media1 endpoint
final envelope = await transport.sendRequest(
    onvif.media.media1.uri, transport.securedEnvelope(requestFragment));

print(envelope.body.response);
```

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
| CreateUsers            | createUsers            | `Future<bool>`                         | [x\] |
| DeleteUsers            | deleteUsers            | `Future<bool>`                         | [x\] |
| GetCapabilities        | getCapabilities        | `Future<Capabilities>`                 | [x\] |
| GetDeviceInformation   | getDeviceInformation   | `Future<GetDeviceInformationResponse>` | [x\] |
| GetDiscoveryMode       | getDiscoveryMode       | `Future<String>`                       | [x\] |
| GetDNS                 | getDNS                 | `Future<DnsInformation>`               | [x\] |
| GetHostname            | getHostname            | `Future<HostnameInformation>`          | [x\] |
| GetNetworkProtocols    | getNetworkProtocols    | `Future<List<NetworkProtocol>>`        | [x\] |
| GetNTP                 | getNtp                 | `Future<NtpInformation>`               | [x\] |
| GetServiceCapabilities | getServiceCapabilities | `Future<DeviceServiceCapabilities>`    | [x\] |
| GetServices            | getServices            | `Future<List<Service>>`                | [x\] |
| GetSystemDateAndTime   | getSystemDateAndTime   | `Future<SystemDateAndTime>`            | [x\] |
| GetSystemUris          | getSystemUris          | `Future<GetSystemUrisResponse>`        | [x\] |
| GetUsers               | getUsers               | `Future<List<User>>`                   | [x\] |

### [Media 1](https://www.onvif.org/ver10/media/wsdl/media.wsdl) 

| Onvif Operation                 | Dart Method                     | Dart Return Type                       | Test |
| ------------------------------- | ------------------------------- | -------------------------------------- | ---- |
| GetAudioSources                 | getAudioSources                 | `Future<List<AudioSource>>`            | [x\] |
| GetMetadataConfiguration        | getMetadataConfiguration        | `Future<MetadataConfiguration>`        | [x\] |
| GetMetadataConfigurations       | getMetadataConfigurations       | `Future<List<MetadataConfiguration>>`  | [x\] |
| GetProfile                      | getProfile                      | `Future<Profile>`                      | [x\] |
| GetProfiles                     | getProfiles                     | `Future<List<Profile>?>`               | [x\] |
| GetServiceCapabilities          | getServiceCapabilities          | `Future<Capabilities1>`			           | [x\] |
| GetSnapshotUri                  | getSnapshotUri                  | `Future<MediaUri>`                     | [x\] |
| GetStreamUri                    | getStreamUri                    | `Future<MediaUri>`                     | [x\] |
| GetVideoSources                 | getVideoSources                 | `Future<VideoSources>`                 | [x\] |
| StartMulticastStreaming         | startMulticastStreaming         | `Future<bool>`                         | [x\] |
| StopMulticastStreaming          | stopMulticastStreaming          | `Future<bool>`                         | [x\] |

### [Media 2](https://www.onvif.org/ver20/media/wsdl/media.wsdl)

| Onvif Operation                 | Dart Method                     | Dart Return Type                       | Test |
| ------------------------------- | ------------------------------- | -------------------------------------- | ---- |
| GetMetadataConfigurationOptions | getMetadataConfigurationOptions | `Future<MetadataConfigurationOptions>` | [x\] |
| GetMetadataConfigurations       | getMetadataConfigurations       | `Future<List<MetadataConfiguration>>`  | [x\] |
| GetProfiles                     | getProfiles                     | `Future<List<MediaProfile>?>`          | [x\] |
| GetServiceCapabilities          | getServiceCapabilities          | `Future<Capabilities2>`                | [x\] |
| GetSnapshotUri                  | getSnapshotUri                  | `Future<String>`                       | [x\] |
| GetStreamUri                    | getStreamUri                    | `Future<String>`                       | [x\] |
| StartMulticastStreaming         | startMulticastStreaming         | `Future<bool>`                         | [x\] |
| StopMulticastStreaming          | stopMulticastStreaming          | `Future<bool>`                         | [x\] |

### [PTZ](https://www.onvif.org/ver20/ptz/wsdl/ptz.wsdl)

| Onvif Operation             | Dart Method                 | Dart Return Type                  | Test |
| --------------------------- | --------------------------- | --------------------------------- | ---- |
| AbsoluteMove                | absoluteMove                | `Future<bool>`                    | [x\] |
| ContinuousMove              | continuousMove              | `Future<bool>`                    | [x\] |
| GetCompatibleConfigurations | getCompatibleConfigurations | `Future<List<PtzConfiguration>>`  | [x\] |
| GetConfiguration            | getConfiguration            | `Future<PtzConfiguration>`        | [x\] |
| GetConfigurationOptions     | getConfigurationOptions     | `Future<PtzConfigurationOptions>` | [x\] |
| GetConfigurations           | getConfigurations           | `Future<List<PtzConfiguration>>`  | [x\] |
| GetPresets                  | getPresets                  | `Future<List<Preset>>`            | [x\] |
| GetServiceCapabilities      | getServiceCapabilities      | `Future<Capabilities>`            | [x\] |
| GetStatus                   | getStatus                   | `Future<PtzStatus>`               | [x\] |
| GotoHomePosition            | gotoHomePosition            | `Future<bool>`                    | [x\] |
| GotoPreset                  | gotoPreset                  | `Future<bool>`                    | [x\] |
| RelativeMove                | relativeMove                | `Future<bool>`                    | [x\] |
| RemovePreset                | removePreset                | `Future<bool>`                    | [x\] |
| SetHomePosition             | setHomePosition             | `Future<bool>`                    | [x\] |
| SetPreset                   | setPreset                   | `Future<String>`                  | [x\] |
| Stop                        | stop                        | `Future<bool>`                    | [x\] |

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

| Manufacturer       | Model          | Known Issue                      |
| ------------------ | -------------- | -------------------------------- |
| D-Link Corporation | DCS-6511       | commands not implemented&#x00B9; |
| Happytimesoft      | IPCamera       |                                  |
| ONVIF              | ENP1A14-IR/25X |                                  |
| NONE               | GX728MF-IR28   | commands not implemented&#x00B2; |

&#x00B9; The following are not implemented for the DCS-6511: 
* Device Management:
  * `GetServices`
  * `GetServiceCapabilities`
* Media1:
  * `GetMetadataConfiguration`
  * `GetProfile`
  * `GetServiceCapabilities`
  * `GetStreamUri`
* Media2:
  * is not supported by this device
* PTZ:
  * not tested

&#x00B2; The following are not implemented for the GX728MF-IR28: 
* Device Management:
  * `GetSystemUris`
* Media1:
  * `GetMetadataConfiguration`
  * `GetProfile`
  * `GetStreamUri`
  * `StartMulticastStreaming`
  * `StopMulticastStreaming`
* Media2:
  * `GetStreamUri`
  * `StartMulticastStreaming`
  * `StopMulticastStreaming`
* PTZ:
  * not supported

## What's next

- More comprehensive unit tests

## Features and bugs

Please file feature requests and bugs with [the issue tracker](https://github.com/faithoflifedev/easy_onvif/issues).

## Known Issues

Github Issue [#23](https://github.com/faithoflifedev/easy_onvif/issues/23), in Flutter when using **v2.0.13+4** and above you may see the following message when performing a `dart pub get`: 

```text
Because every version of flutter from sdk depends on collection 1.16.0 and xml >=6.2.0 depends on collection ^1.17.0, flutter from sdk is incompatible with xml >=6.2.0.
And because easy_onvif >=2.0.13+11 depends on xml ^6.2.2, flutter from sdk is incompatible with easy_onvif >=2.0.13+11.
So, because cow depends on both flutter from sdk and easy_onvif ^2.0.13+13, version solving failed.
pub get failed (1; So, because cow depends on both flutter from sdk and easy_onvif ^2.0.13+13, version solving failed.)
```

The fix for this is to add the following section to your `pubspec.yaml`:

```yaml
dependency_overrides:
  collection: ^1.17.0
```

## Breaking changes

### v2.1.0
The following method signatures have changed in this version:
- PTZ - `continuousMove`
- PTZ - ``

## Contributing

Any help from the open-source community is always welcome and needed:
- Found an issue?
    - Please fill a bug report with details.
- Need a feature?
    - Open a feature request with use cases.
- Are you using and liking the project?
    - Promote the project: create an article or post about it
    - Make a donation
- Do you have a project that uses this package
    - let's cross promote, let me know and I'll add a link to your project
- Are you a developer?
    - Fix a bug and send a pull request.
    - Implement a new feature.
    - Improve the Unit Tests.
- Have you already helped in any way?
    - **Many thanks from me, the contributors and everybody that uses this project!**

*If you donate 1 hour of your time, you can contribute a lot,
because others will do the same, just be part and start with your 1 hour.*