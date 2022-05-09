# Easy Onvif REST API CLI

A command line interface for controlling an Onvif device with cli commands

To install:

```sh
pub global activate easy_onvif -x onvif
```

Usage:

```sh
prompt>onvif --help
A command line interface for controlling Onvif compliant devices

Usage: onvif <command> [arguments]

Global options:
-h, --help           Print this usage information.
    --config-file    (defaults to "$HOME/.onvif/credentials.json")

Available commands:
  authorize           Generate an authentication file for an Onvif device
  device-management   Device management commands.
  media               Media commands.
  ptz                 PTZ commands.
```

|command|description|
|--- |--- |
|[authorize](#authorize)|Generate a credentials file used to authenticate the command line API requests|
|[device-management](#device-management)|Onvif device management commands, [spec](https://www.onvif.org/onvif/ver10/device/wsdl/devicemgmt.wsdl)|
|[media](#media)|Onvif media commands, [spec](https://www.onvif.org/ver10/media/wsdl/media.wsdl)|
|[ptz](#ptz)|Onvif PTZ commands, [spec](https://www.onvif.org/ver20/ptz/wsdl/ptz.wsdl)|

Just like the main library, any responses provided by the above commands will be given in the JSON format.  So ideally, you will want to use a command line json parser to interpret the results.  The recommended json parser for this purpose is [_jq_](https://stedolan.github.io/jq/).  With _jq_ you can process the results of a command as follows:

## Quick start

```sh
#step 1
onvif authorize
#follow prompts

#step 2
onvif ptz get-presets --limit 3 --profile-token Profile_1 | jq -r '.[] | ."@token" + "\t" + .Name'
#output would be
1       Preset 1
2       Preset 2
3       Preset 3
```

## authorize

```sh
prompt>onvif authorize --help

Generate a refresh token used to authenticate the command line API requests

Usage: yt authorize [arguments]
-h, --help    Print this usage information.
```

The authroize command is used to create the default "--config-file" that can be used as the default for all future commands.  In general this command will only need to be run if you want to connect to another onvif device or if the settigns (host, username, password) have changed for the current device.  The file contents are as follows:

```json
{"host":"[host name or ip addess of device]","username":"[device username]","password":"[device password]"}
```

## device-management

```sh
prompt>onvif device-management --help
Device management commands.

Usage: onvif device-management <subcommand> [arguments]
-h, --help    Print this usage information.

Available subcommands:
  get-capabilities           This method has been replaced by the more generic GetServices method. For capabilities of individual services refer to the GetServiceCapabilities methods.
  get-device-information     This operation gets basic device information from the device.
  get-hostname               This operation is used by an endpoint to get the hostname from a device. The device shall return its hostname configurations through the GetHostname command.
  get-network-protocols      This operation gets defined network protocols from a device. The device shall support the GetNetworkProtocols command returning configured network protocols.
  get-ntp                    This operation gets defined network protocols from a device. The device shall support This operation gets the NTP settings from a device. If the device supports NTP, it shall be possible to get the NTP server settings through the GetNTP command.
  get-service-capabilities   Returns the capabilities of the device service. The result is returned in a typed answer.
  get-services               Returns information about services on the device.
  get-system-date-and-time   This operation gets the device system date and time. The device shall support the return of the daylight saving setting and of the manual system date and time (if applicable) or indication of NTP time (if applicable) through the GetSystemDateAndTime command.
  get-system-uris            This operation is used to retrieve URIs from which system information may be downloaded using HTTP
  get-users                  This operation lists the registered users and corresponding credentials on a device. The device shall support retrieval of registered device users and their credentials for the user token through the GetUsers command.
```

### device-management get-capabilities

```sh
prompt>onvif device-management get-capabilities --help
This method has been replaced by the more generic GetServices method. For capabilities of individual services refer to the GetServiceCapabilities methods.

Usage: onvif device-management get-capabilities [arguments]
-h, --help    Print this usage information.
```

### device-management get-device-information

```sh
prompt>onvif device-management get-device-information --help
This operation gets basic device information from the device.

Usage: onvif device-management get-device-information [arguments]
-h, --help    Print this usage information.
```

### device-management get-hostname

```sh
prompt>onvif device-management get-hostname --help
This operation is used by an endpoint to get the hostname from a device. The device shall return its hostname configurations through the GetHostname command.

Usage: onvif device-management get-hostname [arguments]
-h, --help    Print this usage information.

```

### device-management get-network-protocols

```sh
prompt>onvif device-management get-network-protocols --help
This operation gets defined network protocols from a device. The device shall support the GetNetworkProtocols command returning configured network protocols.

Usage: onvif device-management get-network-protocols [arguments]
-h, --help    Print this usage information.
```

### device-management get-service-capabilities

```sh
prompt>onvif device-management get-service-capabilities --help
Returns the capabilities of the device service. The result is returned in a typed answer.

Usage: onvif device-management get-service-capabilities [arguments]
-h, --help    Print this usage information.
```

### device-management get-services

```sh
prompt>onvif device-management get-services --help
Returns information about services on the device.

Usage: onvif device-management get-services [arguments]
-h, --help                       Print this usage information.
-i, --[no-]include-capability    Indicates if the service capabilities (untyped) should be included in the response.
```

### device-management get-system-date-and-time

```sh
prompt>onvif device-management get-system-date-and-time --help
This operation gets the device system date and time. The device shall support the return of the daylight saving setting and of the manual system date and time (if applicable) or indication of NTP time (if applicable) through the GetSystemDateAndTime command.

A device shall provide the UTCDateTime information.

Usage: onvif device-management get-system-date-and-time [arguments]
-h, --help    Print this usage information.
```

### device-management get-system-uris

```sh
prompt>onvif device-management get-system-uris --help
This operation is used to retrieve URIs from which system information may be downloaded using HTTP

Usage: onvif device-management get-system-uris [arguments]
-h, --help    Print this usage information.
```

### device-management get-users

```sh
prompt>onvif device-management get-users --help
This operation lists the registered users and corresponding credentials on a device. The device shall support retrieval of registered device users and their credentials for the user token through the GetUsers command.

Usage: onvif device-management get-users [arguments]
-h, --help    Print this usage information.
```

## media

```sh
prompt>onvif media --help
Media commands.

Usage: onvif media <subcommand> [arguments]
-h, --help    Print this usage information.

Available subcommands:
  get-audio-sources           This command lists all available physical audio inputs of the device.
  get-profiles                Any endpoint can ask for the existing media profiles of a device using the GetProfiles command. Pre-configured or dynamically configured profiles can be retrieved using this command. This command lists all configured profiles in a device. The client does not need to know the media profile in order to use the command.
  get-snapshot-uri            A client uses the GetSnapshotUri command to obtain a JPEG snapshot from the device.
  get-stream-uri              This operation requests a URI that can be used to initiate a live media stream using RTSP as the control protocol
  get-video-sources           This command lists all available physical video inputs of the device.
  start-multicast-streaming   This command starts multicast streaming using a specified media profile of a device.
  stop-multicast-streaming    This command stop multicast streaming using a specified media profile of a device.
```

### media get-audio-sources

```sh
prompt>onvif media get-audio-sources --help
This command lists all available physical audio inputs of the device.

Usage: onvif media get-audio-sources [arguments]
-h, --help    Print this usage information.
```

### media get-profile

```sh
prompt>onvif media get-profiles --help
Any endpoint can ask for the existing media profiles of a device using the GetProfiles command. Pre-configured or dynamically configured profiles can be retrieved using this command. This command lists all configured profiles in a device. The client does not need to know the media profile in order to use the command.

Usage: onvif media get-profiles [arguments]
-h, --help    Print this usage information.
```

### media get-snapshot-uri

```sh
prompt>onvif media get-snapshot-uri --help
A client uses the GetSnapshotUri command to obtain a JPEG snapshot from the device.

Usage: onvif media get-snapshot-uri [arguments]
-h, --help                                 Print this usage information.
-t, --profile-token=<token> (mandatory)    The ProfileToken element indicates the media profile to use and will define the source and dimensions of the snapshot.
    --[no-]valid-until-connect             Indicates if the Uri is only valid until the connection is established.
    --[no-]valid-until-reboot              Indicates if the Uri is invalid after a reboot of the device.
    --timeout                              Duration how long the Uri is valid.
                                           (defaults to "PT0S")
```

### media get-stream-uri

```sh
Usage: onvif media get-stream-uri  --help
This operation requests a URI that can be used to initiate a live media stream using RTSP as the control protocol.

Usage: onvif media get-stream-uri [arguments]
-h, --help                                 Print this usage information.
-t, --profile-token=<token> (mandatory)    The ProfileToken element indicates the media profile to use and will define the source and dimensions of the snapshot.
    --stream-type=<type>                   Defines if a multicast or unicast stream is requested
                                           [RTP-Unicast, RTP-Multicast]
    --transport-protocol=<type>            Defines if a multicast or unicast stream is requested
                                           [UDP, TCP, RTSP (default), HTTP]
    --[no-]valid-until-connect             Indicates if the Uri is only valid until the connection is established.
    --[no-]valid-until-reboot              Indicates if the Uri is invalid after a reboot of the device.
    --timeout                              Duration how long the Uri is valid.
                                           (defaults to "PT0S")
```

### media get-video-sources

```sh
Usage: onvif media get-video-sources  --help
This command lists all available physical video inputs of the device.

Usage: onvif media get-video-sources [arguments]
-h, --help                                 Print this usage information.
-t, --profile-token=<token> (mandatory)    The ProfileToken element indicates the media profile to use and will define the source and dimensions of the snapshot.
    --stream-type=<type>                   Defines if a multicast or unicast stream is requested
                                           [RTP-Unicast, RTP-Multicast]
    --transport-protocol=<type>            Defines if a multicast or unicast stream is requested
                                           [UDP, TCP, RTSP (default), HTTP]
    --[no-]valid-until-connect             Indicates if the Uri is only valid until the connection is established.
    --[no-]valid-until-reboot              Indicates if the Uri is invalid after a reboot of the device.
    --timeout                              Duration how long the Uri is valid.
                                           (defaults to "PT0S")
```

### media start-multicast-streaming

```sh
Usage: onvif media start-multicast-streaming --help
This command starts multicast streaming using a specified media profile of a device.

Usage: onvif media start-multicast-streaming [arguments]
-h, --help    Print this usage information.
```

### media stop-multicast-streaming

```sh
Usage: onvif media stop-multicast-streaming --help
This command stop multicast streaming using a specified media profile of a device.

Usage: onvif media stop-multicast-streaming [arguments]
-h, --help    Print this usage information.
```

## ptz

```sh
Usage: onvif ptz --help
PTZ commands.

Usage: onvif ptz <subcommand> [arguments]
-h, --help    Print this usage information.

Available subcommands:
  absolute-move        Operation to move pan,tilt or zoom to a absolute destination.
  continuous-move      Operation for continuous Pan/Tilt and Zoom movements.
  get-configuration    Get a specific PTZconfiguration from the device, identified by its reference token or name.
  get-configurations   Get all the existing PTZConfigurations from the device.
  get-presets          Operation to request all PTZ presets for the PTZNode in the selected profile.
  get-status           Operation to request PTZ status for the Node in the selected profile.
  goto-preset          Operation to go to a saved preset position for the PTZNode in the selected profile.
  move                 Operation for Relative Pan/Tilt and Zoom Move, without Zoom.
  move-down            Operation for a single step tilt down operation.
  move-left            Operation for a single step pan left operation.
  move-right           Operation for a single step tilt upwards operation
  move-up              Operation for a single step tilt upwards operation.
  relative-move        Operation for Relative Pan/Tilt and Zoom Move.
  remove-preset        Operation to remove a PTZ preset for the Node in the selected profile.
  set-preset           The SetPreset command saves the current device position parameters so that the device can move to the saved preset position through the GotoPreset operation.
  stop                 Operation to stop ongoing pan, tilt and zoom movements of absolute relative and continuous type.
  zoom                 Operation for zoom.
  zoom-in              Operation for a single step zoom in operation.
  zoom-out             Operation for a single step zoom out operation.
```

### ptz absolute-move

```sh
Usage: onvif ptz absolute-move --help
Operation to move pan,tilt or zoom to a absolute destination.

Usage: onvif ptz absolute-move [arguments]
-h, --help                                  Print this usage information.
-t, --profile-token=<token> (mandatory)     The ProfileToken element indicates the media profile to use and will define the source and dimensions of the snapshot.
    --pan-tilt-x=<double> (mandatory)       A Position vector specifying the absolute target position x-axis.
    --pan-tilt-y=<double> (mandatory)       A Position vector specifying the absolute target position y-axis.
    --pan-tilt-zoom=<double> (mandatory)    A Position vector specifying the absolute target position zoom.
```

### ptz continuous-move

```sh
Usage: onvif ptz continuous-move --help
Operation for continuous Pan/Tilt and Zoom movements.

Usage: onvif ptz continuous-move [arguments]
-h, --help                                  Print this usage information.
-t, --profile-token=<token> (mandatory)     The ProfileToken element indicates the media profile to use and will define the source and dimensions of the snapshot.
    --pan-tilt-x=<double> (mandatory)       A Position vector specifying the absolute target position x-axis.
    --pan-tilt-y=<double> (mandatory)       A Position vector specifying the absolute target position y-axis.
    --pan-tilt-zoom=<double> (mandatory)    A Position vector specifying the absolute target position zoom.
```

### ptz get-configuration

```sh
Usage: onvif ptz get-configuration --help
Option ptz-configuration-token is mandatory.

Usage: onvif ptz get-configuration [arguments]
-h, --help                                           Print this usage information.
-t, --ptz-configuration-token=<token> (mandatory)    Token of the requested PTZConfiguration.
```

### ptz get-configurations

```sh
Usage: onvif ptz get-configurations --help
Get all the existing PTZConfigurations from the device.

Usage: onvif ptz get-configurations [arguments]
-h, --help    Print this usage information.
```

### ptz get-presets

```sh
Usage: onvif ptz get-presets --help
Operation to request all PTZ presets for the PTZNode in the selected profile.

Usage: onvif ptz get-presets [arguments]
-h, --help                                 Print this usage information.
-t, --profile-token=<token> (mandatory)    A reference to the MediaProfile where the operation should take place.
    --limit=<int>                          Limit the number of presets returned
```

### ptz get-status

```sh
Usage: onvif ptz get-status --help
Operation to request PTZ status for the Node in the selected profile.

Usage: onvif ptz get-status [arguments]
-h, --help                                 Print this usage information.
-t, --profile-token=<token> (mandatory)    A reference to the MediaProfile where the PTZStatus should be requested.
```

### ptz goto-preset

```sh
Usage: onvif ptz goto-preset --help
Option profile-token is mandatory.

Usage: onvif ptz goto-preset [arguments]
-h, --help                                         Print this usage information.
-t, --profile-token=<profile-token> (mandatory)    A reference to the MediaProfile where the operation should take place.
    --preset-token=<preset-token> (mandatory)      A requested preset token.
```

### ptz move

```sh
Usage: onvif ptz move --help
Operation for Relative Pan/Tilt Move without Zoom.

Usage: onvif ptz move [arguments]
-h, --help                                 Print this usage information.
-t, --profile-token=<token> (mandatory)    The ProfileToken element indicates the media profile to use and will define the source and dimensions of the snapshot.
    --x=<double> (mandatory)               The x component corresponds to pan.
    --y=<double> (mandatory)               The y component corresponds to tilt.
```

### ptz move-down

```sh
Usage: onvif ptz goto-preset --help
Operation for a single step tilt down operation.

Usage: onvif ptz goto-preset [arguments]
-h, --help                                         Print this usage information.
-t, --profile-token=<profile-token> (mandatory)    A reference to the MediaProfile where the operation should take place.
    --preset-token=<preset-token> (mandatory)      A requested preset token.
```

### ptz move-left

```sh
Usage: onvif ptz goto-preset --help
Operation for a single step pan left operation

Usage: onvif ptz goto-preset [arguments]
-h, --help                                         Print this usage information.
-t, --profile-token=<profile-token> (mandatory)    A reference to the MediaProfile where the operation should take place.
    --preset-token=<preset-token> (mandatory)      A requested preset token.
```

### ptz move-right

```sh
Usage: onvif ptz goto-preset --help
Operation for a single step pan right operation

Usage: onvif ptz goto-preset [arguments]
-h, --help                                         Print this usage information.
-t, --profile-token=<profile-token> (mandatory)    A reference to the MediaProfile where the operation should take place.
    --preset-token=<preset-token> (mandatory)      A requested preset token.
```

### ptz move-up

```sh
Usage: onvif ptz move-up --help
Operation for a single step tilt upwards operation.

Usage: onvif ptz move-up [arguments]
-h, --help                                 Print this usage information.
-t, --profile-token=<token> (mandatory)    The ProfileToken element indicates the media profile to use and will define the source and dimensions of the snapshot.
    --step=<int>                           The amount of movement for the step.
```

### ptz relative-move

```sh
Usage: onvif ptz relative-move --help
Operation for Relative Pan/Tilt and Zoom Move.

Usage: onvif ptz relative-move [arguments]
-h, --help                                 Print this usage information.
-t, --profile-token=<token> (mandatory)    The ProfileToken element indicates the media profile to use and will define the source and dimensions of the snapshot.
    --translation-x=<double>               Pan and tilt speed. The x component corresponds to pan. If omitted in a request, the current (if any) PanTilt movement should not be affected.
    --translation-y=<double>               Pan and tilt speed. The y component corresponds to tilt. If omitted in a request, the current (if any) PanTilt movement should not be affected.
    --translation-zoom=<double>            A zoom speed. If omitted in a request, the current (if any) Zoom movement should not be affected.
```

### ptz remove-preset

```sh
Usage: onvif ptz remove-preset --help
Operation to remove a PTZ preset for the Node in the selected profile.

Usage: onvif ptz remove-preset [arguments]
-h, --help                                         Print this usage information.
-t, --profile-token=<profile-token> (mandatory)    A reference to the MediaProfile where the operation should take place.
    --preset-token=<preset-token> (mandatory)      A requested preset token.
```

### ptz set-preset

```sh
Usage: onvif ptz set-preset --help
The SetPreset command saves the current device position parameters so that the device can move to the saved preset position through the GotoPreset operation.

Usage: onvif ptz set-preset [arguments]
-h, --help                                         Print this usage information.
-t, --profile-token=<profile-token> (mandatory)    A reference to the MediaProfile where the operation should take place.
    --preset-token=<preset-token> (mandatory)      A requested preset token.
    --preset-name=<name> (mandatory)    
```

### ptz stop

```sh
Usage: onvif ptz stop --help
Operation to stop ongoing pan, tilt and zoom movements of absolute relative and continuous type.

Usage: onvif ptz stop [arguments]
-h, --help                                 Print this usage information.
-t, --profile-token=<token> (mandatory)    The ProfileToken element indicates the media profile to use and will define the source and dimensions of the snapshot.
    --[no-]pan-tilt                        Set true when we want to stop ongoing pan and tilt movements.If PanTilt arguments are not present, this command stops these movements.
                                           (defaults to on)
    --[no-]zoom                            Set true when we want to stop ongoing zoom movement.If Zoom arguments are not present, this command stops ongoing zoom movement.
                                           (defaults to on) 
```

### ptz zoom

```sh
Usage: onvif ptz zoom --help
Operation for zoom.

Usage: onvif ptz zoom [arguments]
-h, --help                                 Print this usage information.
-t, --profile-token=<token> (mandatory)    The ProfileToken element indicates the media profile to use and will define the source and dimensions of the snapshot.
    --zoom=<double> (mandatory)            The speed for the zoom operation
```

### ptz zoom-in

```sh
Usage: onvif ptz zoom-in --help
Operation for a single step zoom in operation.

Usage: onvif ptz zoom-in [arguments]
-h, --help                                 Print this usage information.
-t, --profile-token=<token> (mandatory)    The ProfileToken element indicates the media profile to use and will define the source and dimensions of the snapshot.
    --step=<int>                           The amount of movement for the step.
```

### ptz zoom-out

```sh
Usage: onvif ptz zoom-out --help
Operation for a single step zoom out operation.

Usage: onvif ptz zoom-out [arguments]
-h, --help                                 Print this usage information.
-t, --profile-token=<token> (mandatory)    The ProfileToken element indicates the media profile to use and will define the source and dimensions of the snapshot.
    --step=<int>                           The amount of movement for the step.
```

### ptz get-current-preset

```sh
Usage: onvif ptz get-current-preset --help
Helper function to get the matching preset for the current PtzPosition and Zoom if there is a match

Usage: onvif ptz get-current-preset [arguments]
-h, --help                                 Print this usage information.
-t, --profile-token=<token> (mandatory)    The ProfileToken element indicates the media profile to use and will define the source and dimensions of the snapshot.
```
