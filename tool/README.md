# Dart Implementation of ONVIF IP Camera Client

This package works with a variety of ONVIF compatible devices allowing for IP Cameras and NVRs (network video recorders) to be integrated into Dart and Flutter applications.  The package includes the ability to control the PTZ (pan-tilt-zoom) movements of a device along with managing presets as well as controlling how video and audio is being streamed from the device.  Review the documentation below to get more details on available features.

[![pub package](https://img.shields.io/pub/v/easy_onvif.svg)](https://pub.dartlang.org/packages/easy_onvif)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Table of contents

- [Getting Started](#getting-started)
  - [Dependency](#dependency)
  - [Usage Example](#usage-example)
  - [Interacting with a device through Onvif operations](#interacting-with-a-device-through-onvif-operations)
- [Lower level requests](#lower-level-requests)
- [Onvif cli (Onvif at the command prompt)](#onvif-cli-onvif-at-the-command-prompt)
- [Supported Onvif Operations](#supported-onvif-operations)
  - [Device Management](#device-management)
  - [Media 1](#media-1)
  - [Media 2](#media-2)
  - [PTZ](#ptz)
  - [PTZ Helper Methods](#ptz-helper-methods)
  - [Recording](#recording)
  - [Replay](#replay)
- [Tested Onvif Devices](#tested-onvif-devices)
- [New for version 2.1.x](#new-for-version-21x)
- [New for version 2.0.x](#new-for-version-20x)
- [Features and bugs](#features-and-bugs)
- [Known Issues](#known-issues)
- [Breaking changes](#breaking-changes)
  - [v2.1.x](#v21x)
- [Contributors](#contributors)
- [Contributing](#contributing)

[![Buy me a coffee](https://www.buymeacoffee.com/assets/img/guidelines/download-assets-1.svg)](https://www.buymeacoffee.com/faithoflif2)

[![Build Status](https://github.com/faithoflifedev/easy_onvif/workflows/Dart/badge.svg)](https://github.com/faithoflifedev/easy_onvif/actions) [![github last commit](https://shields.io/github/last-commit/faithoflifedev/easy_onvif)](https://shields.io/github/last-commit/faithoflifedev/easy_onvif) [![github build](https://img.shields.io/github/actions/workflow/status/faithoflifedev/easy_onvif/dart.yml?branch=main)](https://shields.io/github/workflow/status/faithoflifedev/easy_onvif/Dart) [![github issues](https://shields.io/github/issues/faithoflifedev/easy_onvif)](https://shields.io/github/issues/faithoflifedev/easy_onvif)

## Getting Started

### Dependency

To use this package in your code, first add the dependency to your project:

```yml
dependencies:
  ...
  easy_onvif: ^{{ pubspec.version }}
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

var profileToken = profiles.first.token;
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
  media1              Media1 commands.
  media2              Media2 commands.
  probe               Probe/device discovery command.
  ptz                 PTZ commands.
  version             Display the package name and version.

  Run "onvif help <command>" for more information about a command.
```

Please see the cli documentation [README.md](https://github.com/faithoflifedev/easy_onvif/blob/main/bin/README.md) for more detailed usage information.

## Supported Onvif Operations

### [Device Management](https://www.onvif.org/onvif/ver10/device/wsdl/devicemgmt.wsdl)

| Onvif Operation             | Dart Method                 | Dart Return Type                       | Test |
| --------------------------- | --------------------------- | -------------------------------------- | ---- |
| CreateUsers                 | createUsers                 | `Future<bool>`                         | [x\] |
| DeleteUsers                 | deleteUsers                 | `Future<bool>`                         | [x\] |
| GetCapabilities             | getCapabilities             | `Future<Capabilities>`                 | [x\] |
| GetDeviceInformation        | getDeviceInformation        | `Future<GetDeviceInformationResponse>` | [x\] |
| GetDiscoveryMode            | getDiscoveryMode            | `Future<String>`                       | [x\] |
| GetDNS                      | getDNS                      | `Future<DnsInformation>`               | [x\] |
| GetHostname                 | getHostname                 | `Future<HostnameInformation>`          | [x\] |
| GetNetworkProtocols         | getNetworkProtocols         | `Future<List<NetworkProtocol>>`        | [x\] |
| GetNTP                      | getNtp                      | `Future<NtpInformation>`               | [x\] |
| GetServiceCapabilities      | getServiceCapabilities      | `Future<DeviceServiceCapabilities>`    | [x\] |
| GetServices                 | getServices                 | `Future<List<Service>>`                | [x\] |
| GetStorageConfiguration     | getStorageConfiguration     | `Future<StorageConfiguration>`         | [ \] |
| GetStorageConfigurations    | getStorageConfigurations    | `Future<List<StorageConfiguration>>`   | [ \] |
| GetSystemDateAndTime        | getSystemDateAndTime        | `Future<SystemDateAndTime>`            | [x\] |
| GetSystemUris               | getSystemUris               | `Future<GetSystemUrisResponse>`        | [x\] |
| GetSystemLog                | getSystemLog                | `Future<SystemInformation>`            | [ \] |
| GetSystemSupportInformation | getSystemSupportInformation | `Future<SystemInformation>`            | [ \] |
| GetUsers                    | getUsers                    | `Future<List<User>>`                   | [x\] |
| SystemReboot                | systemReboot                | `Future<String>`                       | [ \] |

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
| GetVideoEncoderInstances        | getVideoEncoderInstances        | `Future<Info>`                         | [ \] |
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

### [Recording](https://www.onvif.org/ver10/recording.wsdl)

| Onvif Operation             | Dart Method                 | Dart Return Type                             | Test |
| --------------------------- | --------------------------- | -------------------------------------------- | ---- |
| CreateRecording             | createRecording             | `Future<String>`                             | [ \] |
| CreateRecordingJob          | createRecordingJob          | `Future<CreateRecordingJobResponse>`         | [ \] |
| DeleteRecording             | deleteRecording             | `Future<bool>`                               | [ \] |
| DeleteRecordingJob          | deleteRecordingJo           | `Future<bool>`                               | [ \] |
| GetRecordingJobs            | getRecordingJobs            | `Future<List<GetRecordingJobsResponseItem>>` | [ \] |
| GetRecordingJobState        | getRecordingJobState        | `Future<List<RecordingJobStateInformation>>` | [ \] |
| GetRecordingOptions         | getRecordingOptions         | `Future<List<RecordingOptions>>`             | [ \] |
| GetRecordings               | getRecordings               | `Future<List<GetRecordingsResponseItem>>`    | [ \] |
| GetServiceCapabilities      | getServiceCapabilities      | `Future<Capabilities>`                       | [ \] |
| setRecordingJobMode         | setRecordingJobMode         | `Future<bool>`                               | [ \] |

### [Replay](https://www.onvif.org/ver10/replay.wsdl)

| Onvif Operation             | Dart Method                 | Dart Return Type                             | Test |
| --------------------------- | --------------------------- | -------------------------------------------- | ---- |
| GetReplayConfiguration      | getReplayConfiguration      | `Future<ReplayConfiguration>`                | [ \] |
| GetReplayUri                | getReplayUri                | `Future<String>`                             | [ \] |
| GetServiceCapabilities      | getServiceCapabilities      | `Future<Capabilities>`                       | [ \] |
| SetReplayConfiguration      | setReplayConfiguration      | `Future<bool>`                               | [ \] |

## Tested Onvif Devices

The values returned by the Onvif API `GetDeviceInformation` call.

| Manufacturer       | Model          | Known Issue                      |
| ------------------ | -------------- | -------------------------------- |
| Happytimesoft      | IPCamera       | limited capabilities             |
| D-Link Corporation | DCS-6511       | commands not implemented&#x00B9; |
| ONVIF              | ENP1A14-IR/25X | commands not implemented&#x00B2; |
| NONE               | GX728MF-IR28   | commands not implemented&#x00B3; |
| LOREX              | LNB4421SB      | testing in progress              |

&#x00B9; The following are not implemented for the ENP1A14-IR/25X:
* Recordings
  * `CreateRecording`
  * `DeleteRecording`

&#x00B2; The following are not implemented for the DCS-6511: 
* Device Management:
  * `GetServices`
  * `GetServiceCapabilities`
* Media1:
  * `GetMetadataConfiguration`
  * `GetProfile`
  * `GetServiceCapabilities`
* Media2:
  * is not supported by this device
* PTZ:
  * not tested

&#x00B3; The following are not implemented for the GX728MF-IR28: 
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


## New for version 2.1.x

* Support for __Media2__ Onvif operations
* Support for __Recording__ Onvif operations (experimental)
* Support for __Replay__ Onvif operations (experimental)

```dart
// defaults to `MixedProfile` a special case object that has the fields for both 
// a media1 `Profile` and a media2 `MediaProfile`.
var profiles = await onvif.media.getProfiles();

// determine the media level supported
print(onvif.media.mediaSupportLevel.name);

// alternatively, make an explicit call to the Media1 operation
var profiles1 = await onvif.media.media1.getProfiles();

// or, make an explicit call to the Media2 operation
var profiles2 = await onvif.media.media2.getProfiles();
```

## New for version 2.0.x

__Device discovery__ is finally here.  If you're using the [command line utility](https://github.com/faithoflifedev/easy_onvif/blob/main/bin/README.md) that became available from v1.0.0, you can discover Onvif devices on your network with the command:

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

### v2.1.x

There is probably a number of breaking changes in this version since some method signatures have changed.  Since a large portion of the code base was rebuilt from scratch tracking all the changes wasn't a priority.  Sorry for any inconvenience.

## Contributors

- <img src="https://avatars.githubusercontent.com/u/923202?v=4" width="25" height="25"> [faithoflifedev](https://github.com/faithoflifedev)
- <img src="https://avatars.githubusercontent.com/u/38936462?v=4" width="25" height="25"> [LODYZ](https://github.com/LODYZ)

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