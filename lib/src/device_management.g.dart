// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_management.dart';

// **************************************************************************
// EasyEnumGenerator
// **************************************************************************

extension CapabilityCategoryExt on CapabilityCategory {
  String get value => [
        'All',
        'Analytics',
        'Device',
        'Events',
        'Imaging',
        'Media',
        'PTZ'
      ][index];
}

extension CapabilityCategoryTxe on String {
  CapabilityCategory? get capabilityCategory => {
        'All': CapabilityCategory.All,
        'Analytics': CapabilityCategory.Analytics,
        'Device': CapabilityCategory.Device,
        'Events': CapabilityCategory.Events,
        'Imaging': CapabilityCategory.Imaging,
        'Media': CapabilityCategory.Media,
        'PTZ': CapabilityCategory.PTZ,
      }[this];
}
