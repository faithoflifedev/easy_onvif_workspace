import 'package:dio/dio.dart';
import 'package:easy_onvif/soap.dart' as soap;
import 'package:easy_onvif/util.dart';
import 'package:loggy/loggy.dart';

import 'device_management.dart';
import 'imaging.dart';
import 'media.dart';
import 'media1.dart';
import 'media2.dart';
import 'ptz.dart';
import 'recordings.dart';
import 'replay.dart';
import 'search.dart';

class Onvif with UiLoggy {
  /// The connection authentication information for the Onvif device
  final AuthInfo authInfo;

  /// Whether to override the authentication specified in the Onvif specification
  final bool overrideSpecificationAuthentication;

  /// The dio instance to use for making http requests
  final Dio _dio;

  /// The host uri of the Onvif device
  final Uri _hostUri;

  /// The map of service namespaces to service urls
  final serviceMap = <String, String>{};

  soap.Transport? _transport;
  DeviceManagement? _deviceManagement;
  Imaging? _imaging;
  Media? _media;
  Ptz? _ptz;
  Recordings? _recordings;
  Replay? _replay;
  Search? _search;

  soap.Transport get transport =>
      _transport ??
      (throw Exception('DeviceManagement services not available'));

  DeviceManagement get deviceManagement =>
      _deviceManagement ??
      (throw Exception('DeviceManagement services not available'));

  Imaging get imaging =>
      _imaging ?? (throw Exception('Imaging services not available'));

  Media get media =>
      _media ?? (throw Exception('Media services not available'));

  Ptz get ptz => _ptz ?? (throw Exception('PTZ services not available'));

  Recordings get recordings =>
      _recordings ?? (throw Exception('Recordings services not available'));

  Replay get replay =>
      _replay ?? (throw Exception('Replay services not available'));

  Search get search =>
      _search ?? (throw Exception('Search services not available'));

  Onvif({
    required this.authInfo,
    required LogOptions logOptions,
    required LoggyPrinter printer,
    Dio? dio,
    this.overrideSpecificationAuthentication = false,
  })  : _dio = dio ??
            Dio(
              BaseOptions(
                connectTimeout: Duration(seconds: 20),
                receiveTimeout: Duration(seconds: 10),
              ),
            )
          ..interceptors.add(LoggingInterceptors()),
        _hostUri = (authInfo.host.startsWith('http')
                ? authInfo.host
                : 'http://${authInfo.host}')
            .parseUri {
    Loggy.initLoggy(logPrinter: printer, logOptions: logOptions);

    _transport = soap.Transport(
      dio: _dio,
      authInfo: authInfo,
      overrideSpecificationAuthentication: overrideSpecificationAuthentication,
    );

    _deviceManagement = DeviceManagement(
        transport: transport,
        uri: '${_hostUri.origin}/onvif/device_service'.parseUri);
  }

  static Future<Onvif> connect({
    /// The host name or IP address of the Onvif device
    required host,

    /// The username to use for authentication
    required username,

    /// The password to use for authentication
    required password,

    /// The log options to use for logging
    LogOptions logOptions = const LogOptions(
      LogLevel.error,
      stackTraceLevel: LogLevel.off,
    ),

    /// The printer to use for logging formatting
    LoggyPrinter printer = const PrettyPrinter(
      showColors: false,
    ),

    /// The dio instance to use for making http requests
    Dio? dio,

    /// Whether to override the authentication specified in the Onvif specification
    bool overrideSpecificationAuthentication = false,
  }) async {
    final onvif = Onvif(
      authInfo: AuthInfo(
        host: host,
        username: username,
        password: password,
      ),
      logOptions: logOptions,
      printer: printer,
      dio: dio,
      overrideSpecificationAuthentication: overrideSpecificationAuthentication,
    );

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

    try {
      final serviceList = await deviceManagement.getServices(
        includeCapability: true,
      );

      serviceMap.addAll(
          {for (var service in serviceList) service.nameSpace: service.xAddr});

      if (serviceMap.containsKey(soap.Xmlns.timg)) {
        _imaging = Imaging(
            transport: transport,
            uri: _serviceUriOfHost(serviceMap[soap.Xmlns.timg]!));
      }

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

      if (serviceMap.containsKey(soap.Xmlns.tse)) {
        _search = Search(
            transport: transport,
            uri: _serviceUriOfHost(serviceMap[soap.Xmlns.tse]!));
      }

      if (media1 != null || media2 != null) {
        _media = Media(
          transport: transport,
          media1: media1,
          media2: media2,
        );
      }
    } catch (e) {
      loggy.warning('GetServices command not supported');
    } finally {
      if (serviceMap.isEmpty) {
        final capabilities = await deviceManagement.getCapabilities();

        if (_imaging == null && capabilities.imaging?.xAddr != null) {
          _imaging = Imaging(
              transport: transport,
              uri: _serviceUriOfHost(capabilities.imaging!.xAddr));
        }

        if (_media == null && capabilities.media?.xAddr != null) {
          _media = Media(
            transport: transport,
            media1: Media1(
                transport: transport,
                uri: _serviceUriOfHost(capabilities.media!.xAddr)),
          );
        }

        if (_ptz == null && capabilities.ptz?.xAddr != null) {
          _ptz = Ptz(
              transport: transport,
              uri: _serviceUriOfHost(capabilities.ptz!.xAddr));
        }
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
