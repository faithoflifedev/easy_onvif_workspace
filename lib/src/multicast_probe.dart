import 'dart:ffi';

import 'package:easy_onvif/probe.dart';
import 'package:easy_onvif/soap.dart';
import 'package:easy_onvif/src/model/envelope.dart';
import 'package:ffi/ffi.dart';
import 'package:loggy/loggy.dart';
import 'package:universal_io/io.dart';
import 'package:uuid/uuid.dart';

final Pointer<T> Function<T extends NativeType>(String symbolName) _lookup =
    () {
  if (Platform.isWindows) {
    return DynamicLibrary.open('${Directory.current}/discovery.dll').lookup;
  } else {
    throw UnimplementedError();
  }
}();

final _discoveryPtr = _lookup<
    NativeFunction<
        Int32 Function(
          Pointer<NativeType>,
          Pointer<NativeType>,
          Int32,
        )>>('discovery');

final _discovery = _discoveryPtr.asFunction<
    int Function(
      Pointer<NativeType>,
      Pointer<NativeType>,
      int,
    )>();

@Packed(1)
sealed class _OnvifDiscoveryData extends Struct {
  @Array<Int8>(128, 8192)
  external Array<Array<Int8>> buf;
}

class MulticastProbe with UiLoggy {
  static final broadcastAddress = InternetAddress('239.255.255.250');

  static final broadcastPort = 3702;

  static final defaultTimeout = 2;

  final int? timeout;

  final onvifDevices = <ProbeMatch>[];

  MulticastProbe({this.timeout});

  Future<void> probe() async {
    loggy.debug('init');

    if (Platform.isWindows) {
      await windowsDiscovery();
    } else {
      await RawDatagramSocket.bind(broadcastAddress, broadcastPort);

      final rawDataGramSocket = await RawDatagramSocket.bind(
          InternetAddress.anyIPv4, 0,
          reuseAddress: false, reusePort: false);

      rawDataGramSocket.listen((RawSocketEvent rawSocketEvent) {
        var dataGram = rawDataGramSocket.receive();

        if (dataGram == null) return;

        String messageReceived = String.fromCharCodes(dataGram.data);

        loggy.debug('RESPONSE ADDRESS:\n${dataGram.address}');

        loggy.debug('RESPONSE:\n$messageReceived');

        var envelope = Envelope.fromXml(messageReceived);

        if (envelope.body.response == null) throw Exception();

        onvifDevices.addAll(
            ProbeMatches.fromJson(envelope.body.response!).probeMatches);
      });

      start(rawDataGramSocket);

      await finish(rawDataGramSocket, timeout);
    }
  }

  /// timeout of 0 or less means no timeout
  void start(RawDatagramSocket rawDataGramSocket) {
    loggy.debug('send');

    loggy.debug(
        'BROADCAST ADDRESS: ${broadcastAddress.address}, PORT: $broadcastPort');

    final messageBodyXml = Transport.probe(Uuid().v4());

    loggy.debug('REQUEST:\n${messageBodyXml.toXmlString(pretty: true)}');

    rawDataGramSocket.send(messageBodyXml.toXmlString(pretty: true).codeUnits,
        broadcastAddress, broadcastPort);
  }

  Future<void> finish(RawDatagramSocket rawDataGramSocket,
      [int? timeout]) async {
    await Future.delayed(Duration(seconds: timeout ?? defaultTimeout));

    rawDataGramSocket.close();
  }

  Future<void> windowsDiscovery(
      [Duration duration = const Duration(seconds: 5)]) async {
    final onvifDevices = <ProbeMatch>[];

    final data = calloc<_OnvifDiscoveryData>();

    final probeMessageData =
        Transport.probe(Uuid().v4()).toXmlString().toNativeUtf8();

    final devices = _discovery(data, probeMessageData, duration.inMilliseconds);

    for (var index = 0; index < devices; index++) {
      var envelope = Envelope.fromXml(
          Pointer.fromAddress(data.address + index * 8192)
              .cast<Utf8>()
              .toDartString());

      onvifDevices
          .addAll(ProbeMatches.fromJson(envelope.body.response!).probeMatches);
    }

    malloc.free(probeMessageData);
    calloc.free(data);
  }
}
