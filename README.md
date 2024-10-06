# Dart Implementation of ONVIF IP Camera Client

<p align="center" width="100%">
<img src="https://github.com/faithoflifedev/easy_onvif_workspace/blob/main/logo/easy_onvif_logo_640.png?raw=true" width="200" />
</p>

This is the repository for two related Dart packages:

**[easy_onvif](https://github.com/faithoflifedev/easy_onvif_workspace/tree/main/packages/easy_onvif)** - This package works with a variety of ONVIF compatible devices allowing for IP Cameras and NVRs (network video recorders) to be integrated into Dart and Flutter applications.  The package includes the ability to control the PTZ (pan-tilt-zoom) movements of a device along with managing presets as well as controlling how video and audio is being streamed from the device.  Review the documentation below to get more details on available features.

**[onvif_cli](https://github.com/faithoflifedev/easy_onvif_workspace/tree/main/packages/easy_onvif_cli)** - A command line interface application for controlling an Onvif device through terminal commands.  This tool allows you to use O/S features like `cron` to automate Onvif device functionality.