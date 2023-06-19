# Changelog

## 2.1.2+13

* updated dependencies
* `Imaging`
  * SetCurrentPreset

## 2.1.2+12

split probeMatch scope containing html

## 2.1.2+11

convert html entities appearing in probe response

## 2.1.2+8

strings aren&#x27;t integers

## 2.1.2+5

annotated_shelf was a big mistake

## 2.1.2+4

simple ws-proxy support

## 2.1.2

The following helper methods have been added to the package:
* `Search` request support has been added (experimental)
  * FindRecordings
  * GetRecordingSearchResults
  * GetRecordingInformation
  * GetRecordingSummary
* `Imaging` request support has been added (experimental)
  * GetCurrentPreset
  * GetPresets
  * GetServiceCapabilities
  * GetStatus
* `Media` ver20
  * GetVideoSourceConfigurationOptions
* Multicast Probe
  * general improvements

## 2.1.1-dev.1

The following helper methods have been added to the package:
* `Recordings` request support has been added (experimental)
  * CreateRecording
  * CreateRecordingJob
  * DeleteRecording
  * DeleteRecordingJob
  * GetRecordingJobs
  * GetRecordingJobState
  * GetRecordingOptions
  * GetRecordings
  * GetServiceCapabilities
  * SetRecordingJobMode
* `Replay` request support has been added (experimental)
  * GetReplayConfiguration
  * GetReplayUri
  * GetServiceCapabilities
  * SetReplayConfiguration
* `Device Management`
  * GetStorageConfiguration
  * GetStorageConfigurations
  * GetSystemLog
  * GetSystemSupportInformation
  * SystemReboot
* `Media` ver20
  * GetVideoEncoderInstances

The following bug fixes were made:
  * media2.getStreamUri throws **connection closed** - https:&#x2F;&#x2F;github.com&#x2F;faithoflifedev&#x2F;easy_onvif&#x2F;issues&#x2F;32#issuecomment-1493346568
  * https:&#x2F;&#x2F;github.com&#x2F;faithoflifedev&#x2F;easy_onvif&#x2F;issues&#x2F;41 - a failed onvif.connect will throw an exception

## 2.1.0-dev.17

* support `PtzSpeed` for `gotoHomePosition` and `gotoPreset`
* default to RTSP transport for media1 getStreamUri

## 2.1.0-dev.16

* Issue - https:&#x2F;&#x2F;github.com&#x2F;faithoflifedev&#x2F;easy_onvif&#x2F;issues&#x2F;38
* remove deprecated annotation, since the code still needs to support old devices regardless

## 2.1.0-dev.15

* Issue - https:&#x2F;&#x2F;github.com&#x2F;faithoflifedev&#x2F;easy_onvif&#x2F;issues&#x2F;37
  * Future&lt;String&gt; `media.getSnapshotUri(profileToken)` 
  * Future&lt;String&gt; `media.getStreamUri(profileToken)` 
  * both methods will return a `String` independent of the `MediaSupportLevel` if the device
  * media.mediaSupportLevel can be used to determine what level of support is available on the device

## 2.1.0-dev.14

* improved readme

## 2.1.0-dev.13

* improved readme
* added pana to workflow
* added spellcheck to workflow

## 2.1.0-dev.12

* fixes empty map in response [#35](https:&#x2F;&#x2F;github.com&#x2F;faithoflifedev&#x2F;easy_onvif&#x2F;issues&#x2F;35)
* fixes wrong namespace for GetStreamUri [#36](https:&#x2F;&#x2F;github.com&#x2F;faithoflifedev&#x2F;easy_onvif&#x2F;issues&#x2F;36)

## 2.1.0-dev.11

* adds `MixedProfile` ro resolve Issue #34

## 2.1.0-dev.10

* use secured header for GetServices request Issue #32

## 2.1.0-dev.9

* merged back in LODYZ changes

## 2.1.0-dev.8

* remove diox

## 2.1.0-dev.7

* API doc updates

## 2.1.0-dev.6

* diox

## 2.1.0-dev.5

* Adjusted logging

## 2.1.0-dev.4

* `media.getProfiles()` now returns empty list instead of null
* README corrections

## 2.1.0-dev.3

* fix README

## 2.1.0-dev.2

* GetVideoEncoderInstances

## 2.1.0-dev.1

* now supports Media2 Operations
* code restructured for simpler maintenance
* unit tests based on responses from multiple devices
* documentation updates

## 2.0.13+19

* dependency bump

## 2.0.13+18

# Changelog

## 2.0.13+18

# Changelog

## 2.0.13+17

* Issue [#26](https:&#x2F;&#x2F;github.com&#x2F;faithoflifedev&#x2F;easy_onvif&#x2F;issues&#x2F;26)

## 2.0.13+16

* Issue [#25](https:&#x2F;&#x2F;github.com&#x2F;faithoflifedev&#x2F;easy_onvif&#x2F;issues&#x2F;25)
* dependency bump

## 2.0.13+15

* Issue [#25](https:&#x2F;&#x2F;github.com&#x2F;faithoflifedev&#x2F;easy_onvif&#x2F;issues&#x2F;25)
* Some devices don&#x27;t use DateTimeType
* Updated readme

## 2.0.13+14

* Issue [#24](https:&#x2F;&#x2F;github.com&#x2F;faithoflifedev&#x2F;easy_onvif&#x2F;issues&#x2F;24)
* Added a &#x27;known issues&#x27; section to the README

## 2.0.13+13

* ip address in probe response

## 2.0.13+12

* Issue #22

## 2.0.13+11

* Issue #22
* Dependency bump

## 2.0.13+10

* GotoHomePosition now supported

## 2.0.13+9

* Issue #21 - fix to dependencies

## 2.0.13+8

* Issue #20 (again)

## 2.0.13+7

* DeviceManagement
  * GetDiscoveryMode
  * GetDNS

## 2.0.13+6

VideoEncoderConfiguration
  * Resolution is now optional
  * RateControl is now optional
  * `encoding` previously made optional

## 2.0.13+5

* real fix for issue #20

## 2.0.13+4

* dependency bump

## 2.0.13+3

* updated build tools
* dependency bump
* ISSUE #20

## 2.0.13+1

* updated build tools
* dependency bump
* ISSUE #20

## 2.0.13

* correction for failed tests

## 2.0.12+1

* correction for failed tests

## 2.0.12

* improved release task in grind build

## 2.0.11

* tweak to README
* bool response for `gotoPreset`
* auto create release during publish

## 2.0.10

* homebrew installation for onvif cli
* default debug for cli now set to &quot;off&quot;

## 2.0.9

- corrects ptz.continuousMove error when `zoom` was not included as a parameter 
- issue #18 - adds tests for ptz.continuousMove and ptz.stop 
- improvements to the cli README

## 2.0.8

- flutter example .metadata

## 2.0.7

- add package version info to cli onvif --help output

## 2.0.6

- improved logging and support for non-compliant TL-IPC43AN-4 with simulated RelativeMove and DateTime.tryParse

## 2.0.5

- update to the README

## 2.0.4

- default logging messed up piping to `jq` for cli actions

## 2.0.3

- adjust README

## 2.0.2

- bugfix for Onvif discovery and associated unit tests

## 2.0.1

- logging for Onvif discovery

## 2.0.0

- initial support for device discovery

## 1.1.0

- works with Happytimesoft reference server

## 1.0.9

- additional onvif device support

## 1.0.8

- fixed a test

## 1.0.7

- addition of logging functionality

## 1.0.4

- cleanup the package

## 1.0.3

- added quick-start to bin&#x2F;README.md

## 1.0.2

- resolves the -not supported- error for getProfiles

## 1.0.1

- include the bin folder since it&#x27;s important

## 1.0.0-dev.2

- include the bin folder since it&#x27;s important

## 1.0.0-dev.1

- getServiceCapabilities, getServices and fromJson parsing to simplify models

## 0.0.15

- Improvements to PTZ move helpers, so now the motion makes a little more sense.

## 0.0.14

- Added &quot;GetConfiguration&quot; and &quot;GetConfigurations&quot; the PTZ move helper functions move based on device defaults.

## 0.0.13

- The &quot;GetSystemDateAndTimeResponse&quot; now better matches the spec and a typo fix for the &quot;GetCapabilities&quot; request.

## 0.0.12

- ONVIF SOAP faults are no longer dart objects since the XML response does not match the documented spec.  Additional support for optional elements in the spec

## 0.0.11

- ONVIF SOAP faults do not match the spec they refer to on some devices, and now a static instance of Dio.

## 0.0.10

- GetProfile from media.wsdl has optional fields that were required in code

## 0.0.9

- Apparently an Onvif device can respond with an empty soap &quot;Header&quot;

## 0.0.8

- better interpretation of parsed XML

## 0.0.7

- closer match to Onvif spec for Capabilities

## 0.0.6

- improved API docs

## 0.0.5

- tweaked the grind workflow

## 0.0.4

- now using universal_io for better platform compatibility

## 0.0.3

- published to pub.dev using custom grinder tasks

## 0.0.2

- initial release
