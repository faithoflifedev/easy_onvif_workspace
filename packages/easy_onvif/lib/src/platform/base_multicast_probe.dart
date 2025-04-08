import 'dart:async';

class BaseMulticastProbe {
  static final broadcastPort = 3702;

  static final defaultTimeout = 2;

  static final defaultAnnounceInterval = 180;

  static int messageNumber = 1;

  final stopSignal = Completer<void>();

  Future<void> probe() => throw Exception('Stub implementation');

  Future<void> hello() => throw Exception('Stub implementation');

  Future<void> bye() => throw Exception('Stub implementation');

  void shutdown() => stopSignal.complete();

  Future<void> announce() async => Timer.periodic(
    Duration(minutes: 3),
    (Timer timer) async =>
        stopSignal.isCompleted ? timer.cancel() : await hello(),
  );
}
