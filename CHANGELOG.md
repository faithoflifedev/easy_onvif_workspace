# Changelog

## 2.0.4

- default logging messed up piping to `jq` for cli actions

## 2.0.3

- adjust README

## 2.0.2

- bugfix for Onvif discovery and associated unit tests

## 2.0.1

- logging for Onvif discovert

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

- added quickstart to bin&#x2F;README.md

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

- GetProfile from media.wdsl has optional fields that were required in code

## 0.0.9

- Apparently an Onvif device can respond with an empty soap &quot;Header&quot;

## 0.0.8

- better inpterpretation of parsed XML

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
