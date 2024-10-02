import 'package:easy_onvif/probe.dart';

import 'base_multicast_probe.dart';

class MulticastProbeImpl implements BaseMulticastProbe {
  MulticastProbeImpl({int? timeout, bool? releaseMode});

  List<ProbeMatch> get onvifDevices => throw UnimplementedError();

  @override
  Future<void> probe() =>
      throw UnsupportedError('Cannot perform a probe on this platform.');
}
