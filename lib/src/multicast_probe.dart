import 'package:easy_onvif/onvif.dart';
import 'package:loggy/loggy.dart';
import 'package:universal_io/io.dart';
import 'package:uuid/uuid.dart';

class MulticastProbe with UiLoggy {
  static final broadcastAddress = InternetAddress('239.255.255.250');

  static final broadcastPort = 3702;

  static final defaultTimeout = 2;

  final int? timeout;

  final onvifDevices = <ProbeMatch>[];

  MulticastProbe({this.timeout});

  Future<void> probe() async {
    loggy.debug('init');

    await RawDatagramSocket.bind(broadcastAddress, broadcastPort);

    final rawDatagramSocket = await RawDatagramSocket.bind(
        InternetAddress.anyIPv4, 0,
        reuseAddress: false, reusePort: false);

    rawDatagramSocket.listen((RawSocketEvent rawSocketEvent) {
      var datagram = rawDatagramSocket.receive();

      if (datagram == null) return;

      String messageReceived = String.fromCharCodes(datagram.data);

      loggy.debug('RESPONSE ADDRESS:\n${rawDatagramSocket.address}');

      loggy.debug('RESPONSE:\n$messageReceived');

      var envelope = Envelope.fromXml(messageReceived);

      if (envelope.body.probeMatches == null) return;

      onvifDevices.addAll(envelope.body.probeMatches!.probeMatches);
    });

    start(rawDatagramSocket);

    await finish(rawDatagramSocket);
  }

  ///timeout of 0 or less means no timeout
  void start(RawDatagramSocket rawDatagramSocket) {
    loggy.debug('send');

    loggy.debug(
        'BROADCAST ADDRESS: ${broadcastAddress.address}, PORT: $broadcastPort');

    final messageBodyXml = SoapRequest.probe(Uuid().v4());

    loggy.debug('REQUEST:\n${messageBodyXml.toXmlString(pretty: true)}');

    rawDatagramSocket.send(messageBodyXml.toXmlString(pretty: true).codeUnits,
        broadcastAddress, broadcastPort);

    // rawDatagramSocket.close();
  }

  Future<void> finish(RawDatagramSocket rawDatagramSocket,
      [int? timeout]) async {
    await Future.delayed(Duration(seconds: timeout ?? defaultTimeout));

    rawDatagramSocket.close();
  }
}
