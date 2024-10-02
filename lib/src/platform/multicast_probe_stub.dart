import 'package:easy_onvif/probe.dart';

import 'base_multicast_probe.dart';

class MulticastProbeImpl extends BaseMulticastProbe {
  MulticastProbeImpl({int? timeout, bool? releaseMode}) : super();

  List<ProbeMatch> get onvifDevices => <ProbeMatch>[];

  @override
  Future<void> probe() async => throw Exception('Stub implementation');
}
