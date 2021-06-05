ONVIF Client protocol Profile S (Live Streaming) Dart implementation.

This is a wrapper to ONVIF protocol which allows you to get information about your NVT (network video transmitter) device, its media sources, control PTZ (pan-tilt-zoom) movements and manage presets.  It will also allow you to get information about your NVR (network video recorder).

## Getting Started
In your project add the dependency:

```yml
dependencies:
  ...
  easy_onvif: ^{{ version }}
```

For help getting started with dart, check out these [guides](https://dart.dev/guides).

## Usage Example
Import the easy_onvif library.

```dart
import 'package:easy_onvif/onvif.dart';
```

## Connecting to an Onvif device
```dart
var onvif =
	Onvif(host: '[your onvif device ip]', username: '[theUser]', password: '[thePassword]');

await onvif.initialize();
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

### [Device Management](http://www.onvif.org/onvif/ver10/device/wsdl/devicemgmt.wsdl):

Onvif Operation			| Dart Method				| Dart Return Type
------------------------|---------------------------|------------------------------------
GetCapabilities 		| getCapabilities			|```Future<Capabilities>```
GetDeviceInformation	| getDeviceInformation		|```Future<GetDeviceInformationResponse>```
GetHostname				| getHostname				|```Future<HostnameInformation>```
GetNetworkProtocols		| getNetworkProtocols		|```Future<List<NetworkProtocol>>```
GetNtpResponse			| getNtpResponse			|```Future<NtpInformation>```
GetServices				| getServices				|```Future<List<Service>>```
GetSystemDateAndTime	| getSystemDateAndTime		|```Future<SystemDateAndTime>```
GetSystemUris			| getSystemUris				|```Future<GetSystemUrisResponse>```
GetUsers				| getUsers					|```Future<List<User>>```
		
### [Media](http://www.onvif.org/ver10/media/wsdl/media.wsdl):

Onvif Operation			| Dart Method				| Return Type
------------------------|---------------------------|------------------------------------
GetAudioSources			| getAudioSources			|```Future<AudioSource>```
GetProfiles				| getProfiles				|```Future<List<Profile>>```
GetSnapshotUri			| getSnapshotUri			|```Future<MediaUri>```
GetStreamUri			| getStreamUri				|```Future<MediaUri>```
GetVideoSources			| getVideoSources			|```Future<VideoSources>```
StartMulticastStreaming	| startMulticastStreaming	|```Future<void>```
StopMulticastStreaming	| stopMulticastStreaming	|```Future<void>```

### [PTZ](https://www.onvif.org/ver20/ptz/wsdl/ptz.wsdl):

Onvif Operation			| Dart Method				| Return Type
------------------------|---------------------------|------------------------------------
AbsoluteMove			| absoluteMove				|```Future<void>```
ContinuousMove			| continuousMove			|```Future<void>```
GetPresets				| getPresets				|```Future<List<Preset>>```
GetStatus				| getStatus					|```Future<PtzStatus>```
GotoPreset				| gotoPreset				|```Future<void>```
RelativeMove			| relativeMove				|```Future<void>```
RemovePreset			| removePreset				|```Future<void>```
SetPreset				| setPreset					|```Future<String>```
Stop					| stop						|```Future<void>```

### PTZ Helper Methods:

Onvif Operation			| Dart Method				| Return Type
------------------------|---------------------------|------------------------------------
N/A						| moveDown					|```Future<void>```
N/A						| moveLeft					|```Future<void>```
N/A						| moveRight					|```Future<void>```
N/A						| moveUp					|```Future<void>```
N/A						| zoomIn					|```Future<void>```
N/A						| zoomOut					|```Future<void>```
