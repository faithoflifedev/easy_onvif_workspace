import 'package:easy_onvif/onvif.dart';
import 'package:universal_io/io.dart';
import 'package:uuid/uuid.dart';

class MulticastProbe {
  static final broadcastAddress = InternetAddress('239.255.255.250');

  static final broadcastPort = 3702;

  ///timeout of 0 or less means no timeout
  static Future<void> send(
      {required Function(List<ProbeMatch>) onReceive, int? timeout}) async {
    final messageBodyXml = SoapRequest.probe(Uuid().v4());

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

      var envelope = Envelope.fromXml(messageRecived);

      if (envelope.body.probeMatches == null) return;

      onReceive(envelope.body.probeMatches!.probeMatches);
    });

    if (timeout != null && timeout > 0) {
      await Future.delayed(Duration(seconds: timeout));

      rawDatagramSocket.close();
    }
  }
}
