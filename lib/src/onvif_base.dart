import 'package:dio/dio.dart';
import 'package:easy_onvif/soap.dart' as soap;
import 'package:easy_onvif/util.dart';
import 'package:loggy/loggy.dart';

import 'device_management.dart';
import 'media.dart';
import 'media1.dart';
import 'media2.dart';
import 'ptz.dart';
import 'recordings.dart';
import 'replay.dart';

class Onvif with UiLoggy {
  final AuthInfo authInfo;
  final Uri _hostUri;

  final serviceMap = <String, String>{};

  soap.Transport? _transport;
  DeviceManagement? _deviceManagement;
  Media? _media;
  Ptz? _ptz;
  Recordings? _recordings;
  Replay? _replay;

  soap.Transport get transport =>
      _transport ??
      (throw Exception('DeviceManagement services not available'));

  DeviceManagement get deviceManagement =>
      _deviceManagement ??
      (throw Exception('DeviceManagement services not available'));

  Media get media =>
      _media ?? (throw Exception('Media services not available'));

  Ptz get ptz => _ptz ?? (throw Exception('PTZ services not available'));

  Recordings get recordings =>
      _recordings ?? (throw Exception('Recordings services not available'));

  Replay get replay =>
      _replay ?? (throw Exception('Replay services not available'));

  Onvif(
      {required this.authInfo,
      required LogOptions logOptions,
      required LoggyPrinter printer})
      : _hostUri = (authInfo.host.startsWith('http')
                ? authInfo.host
                : 'http://${authInfo.host}')
            .parseUri {
    Loggy.initLoggy(logPrinter: printer, logOptions: logOptions);

    final dio = Dio(
      BaseOptions(
        connectTimeout: Duration(seconds: 20),
        receiveTimeout: Duration(seconds: 10),
      ),
    )..interceptors.add(LoggingInterceptors());

    _transport = soap.Transport(dio: dio, authInfo: authInfo);

    _deviceManagement = DeviceManagement(
        transport: transport,
        uri: '${_hostUri.origin}/onvif/device_service'.parseUri);
  }

  static Future<Onvif> connect(
      {required host,
      required username,
      required password,
      LogOptions logOptions = const LogOptions(
        LogLevel.error,
        stackTraceLevel: LogLevel.off,
      ),
      LoggyPrinter printer = const PrettyPrinter(
        showColors: false,
      )}) async {
    final onvif = Onvif(
        authInfo: AuthInfo(
          host: host,
          username: username,
          password: password,
        ),
        logOptions: logOptions,
        printer: printer);

    await onvif.initialize();

    return onvif;
  }

  /// Connect to the Onvif device and determine the time delta which is required
  /// for future requests.
  Future<Duration> getTimeDelta() async {
    final dateTime = await deviceManagement.getSystemDateAndTime();

    return dateTime.utcDateTime != null
        ? dateTime.utcDateTime!.difference(DateTime.now().toUtc())
        : const Duration(seconds: 0);
  }

  /// Connect to the Onvif device and retrieve its capabilities
  Future<void> initialize() async {
    loggy.info('initializing ...');

    Media1? media1;
    Media2? media2;

    soap.Transport.timeDelta = await getTimeDelta();

    final serviceList = await deviceManagement.getServices(true);

    serviceMap.addAll(
        {for (var service in serviceList) service.nameSpace: service.xAddr});

    if (serviceMap.containsKey(soap.Xmlns.trt)) {
      media1 = Media1(
          transport: transport,
          uri: _serviceUriOfHost(serviceMap[soap.Xmlns.trt]!));
    }

    if (serviceMap.containsKey(soap.Xmlns.tr2)) {
      media2 = Media2(
          transport: transport,
          uri: _serviceUriOfHost(serviceMap[soap.Xmlns.tr2]!));
    }

    if (serviceMap.containsKey(soap.Xmlns.tptz)) {
      _ptz = Ptz(
          transport: transport,
          uri: _serviceUriOfHost(serviceMap[soap.Xmlns.tptz]!));
    }

    if (serviceMap.containsKey(soap.Xmlns.trc)) {
      _recordings = Recordings(
          transport: transport,
          uri: _serviceUriOfHost(serviceMap[soap.Xmlns.trc]!));
    }

    if (serviceMap.containsKey(soap.Xmlns.trp)) {
      _replay = Replay(
          transport: transport,
          uri: _serviceUriOfHost(serviceMap[soap.Xmlns.trp]!));
    }

    if (media1 != null || media2 != null) {
      _media = Media(
        transport: transport,
        media1: media1,
        media2: media2,
      );
    } else {
      loggy.warning('GetServices command not supported');

      final capabilities = await deviceManagement.getCapabilities();

      if (capabilities.media?.xAddr != null) {
        _media = Media(
          transport: transport,
          media1: Media1(
              transport: transport,
              uri: _serviceUriOfHost(capabilities.media!.xAddr)),
        );
      }

      if (capabilities.ptz?.xAddr != null) {
        _ptz = Ptz(
            transport: transport,
            uri: _serviceUriOfHost(capabilities.ptz!.xAddr));
      }
    }

    loggy.info('initialization complete');
  }

  /// If the host and port of the original request to the host is different for
  /// a service uri, then the request has been made through a firewall and the
  /// host portion of the uri will need to be updated appropriately.
  Uri _serviceUriOfHost(String serviceUrl) {
    final serviceUri = serviceUrl.parseUri;

    if (_hostUri.host == serviceUri.host &&
        (_hostUri.port == serviceUri.port)) {
      return serviceUri;
    }

    return _hostUri.replace(
      path: serviceUri.path,
      query: serviceUri.query == '' ? null : serviceUri.query,
      fragment: serviceUri.fragment == '' ? null : serviceUri.fragment,
    );
  }

  /* for testing:
        , postProcess: (String xmlBody, dynamic jsonMap, Envelope envelope) {
      print(xmlBody);
      print('\n\n');
      print(jsonMap);
    } */
}

class AuthInfo {
  final String host;
  final String username;
  final String password;

  AuthInfo({
    required this.host,
    required this.username,
    required this.password,
  });
}
