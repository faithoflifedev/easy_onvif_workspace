import 'dart:async';

import 'package:easy_onvif/probe.dart';

import 'base_multicast_probe.dart';

class MulticastProbeImpl implements BaseMulticastProbe {
  MulticastProbeImpl({int? timeout, bool? releaseMode});

  List<ProbeMatch> get onvifDevices => throw UnimplementedError();

  @override
  Future<void> probe() =>
      throw UnsupportedError('Cannot perform a probe on this platform.');

  @override
  Future<void> bye() => throw UnimplementedError();

  @override
  Future<void> hello() => throw UnimplementedError();

  @override
  Future<void> announce() => throw UnimplementedError();

  @override
  Completer<void> get stopSignal => throw UnimplementedError();

  @override
  void shutdown() => throw UnimplementedError();
}
