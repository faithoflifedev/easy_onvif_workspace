import 'package:easy_onvif/onvif.dart';
import 'package:loggy/loggy.dart';
import 'package:universal_io/io.dart';
import 'package:uuid/uuid.dart';

class MulticastProbe with UiLoggy {
  static final broadcastAddress = InternetAddress('239.255.255.250');

  static final broadcastPort = 3702;

  static final defaultTimeout = 2;

  ///timeout of 0 or less means no timeout
  Future<void> send(
      {required Function(List<ProbeMatch>) onReceive, int? timeout}) async {
    loggy.debug('send');

    loggy.debug(
        'BROADCAST ADDRESS: ${broadcastAddress.address}, PORT: $broadcastPort');

    final messageBodyXml = SoapRequest.probe(Uuid().v4());

    loggy.debug('REQUEST:\n$messageBodyXml');

    await RawDatagramSocket.bind(broadcastAddress, broadcastPort);

    final rawDatagramSocket = await RawDatagramSocket.bind(
        InternetAddress.anyIPv4, 0,
        reuseAddress: false, reusePort: false);

    rawDatagramSocket.send(
        messageBodyXml.outerXml.codeUnits, broadcastAddress, broadcastPort);

    rawDatagramSocket.listen((RawSocketEvent rawSocketEvent) {
      var datagram = rawDatagramSocket.receive();

      if (datagram == null) return;

      String messageRecived = String.fromCharCodes(datagram.data);

      loggy.debug('RESPONSE:\n$messageRecived');

      var envelope = Envelope.fromXml(messageRecived);

      if (envelope.body.probeMatches == null) return;

      onReceive(envelope.body.probeMatches!.probeMatches);
    });

    await Future.delayed(Duration(seconds: timeout ?? defaultTimeout));

    rawDatagramSocket.close();
  }
}
