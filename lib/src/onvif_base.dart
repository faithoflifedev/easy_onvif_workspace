import 'package:dio/dio.dart';
import 'package:easy_onvif/onvif.dart';
import 'package:loggy/loggy.dart';
import 'package:xml/xml.dart';

class Onvif with UiLoggy {
  late final DeviceManagement deviceManagement;

  final String username;
  final String password;

  final serviceMap = <String, String>{};

  Duration? _timeDelta;
  Media? _media;
  Ptz? _ptz;

  Duration get timeDelta => _timeDelta!;

  Media get media {
    if (_media == null) throw Exception('Media services not available');

    return _media!;
  }

  Ptz get ptz {
    if (_ptz == null) throw Exception('PTZ services not available');

    return _ptz!;
  }

  static Future<Onvif> connect(
      {required host,
      required username,
      required password,
      LogOptions logOptions = const LogOptions(
        LogLevel.error,
        stackTraceLevel: LogLevel.error,
      ),
      LoggyPrinter printer = const PrettyPrinter(
        showColors: false,
      )}) async {
    var onvif = Onvif(
        host: host,
        username: username,
        password: password,
        logOptions: logOptions,
        printer: printer);

    await onvif.initialize();

    return onvif;
  }

  Onvif(
      {required host,
      required this.username,
      required this.password,
      required LogOptions logOptions,
      required LoggyPrinter printer}) {
    Loggy.initLoggy(logPrinter: printer, logOptions: logOptions);

    final dio = Dio();

    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      loggy.debug('URI: ${options.uri}');

      loggy.debug('REQUEST:\n${options.data}');

      return handler.next(options); //continue
    }, onResponse: (response, handler) {
      loggy.debug('RESPONSE:\n${response.data}');

      return handler.next(response); // continue
    }, onError: (DioError e, handler) {
      loggy.error('ERROR:\n$e');

      return handler.next(e); //continue
    }));

    Soap.dio = dio;

    // Logger.root.onRecord.listen((LogRecord record) => logOutput!.write(sprintf(
    //     '%26s %7s - %5s - %s\n',
    //     [record.time, record.level, record.loggerName, record.message])));

    deviceManagement =
        DeviceManagement(onvif: this, uri: 'http://$host/onvif/device_service');
  }

  ///Connect to the Onvif device and retrieve its capabilities
  Future<void> initialize() async {
    loggy.info('initializing ...');

    final datetime = await deviceManagement.getSystemDateAndTime();

    _timeDelta = datetime.utcDateTime != null
        ? datetime.utcDateTime!.difference(DateTime.now().toUtc())
        : const Duration(seconds: 0);

    try {
      final serviceList = await deviceManagement.getServices();

      serviceMap.addAll(
          {for (var service in serviceList) service.nameSpace: service.xAddr});

      if (serviceMap.containsKey('http://www.onvif.org/ver10/media/wsdl')) {
        _media = Media(
            onvif: this,
            uri: serviceMap['http://www.onvif.org/ver10/media/wsdl']!);
      }

      if (serviceMap.containsKey('http://www.onvif.org/ver20/ptz/wsdl')) {
        _ptz = Ptz(
            onvif: this,
            uri: serviceMap['http://www.onvif.org/ver20/ptz/wsdl']!);
      }
    } catch (error) {
      loggy.warning('GetServices command not supported');
    } finally {
      final capabilities = await deviceManagement.getCapabilities();

      if (capabilities.media?.xaddr != null) {
        _media = Media(onvif: this, uri: capabilities.media!.xaddr);
      }

      if (capabilities.ptz?.xAddr != null) {
        _ptz = Ptz(onvif: this, uri: capabilities.ptz!.xAddr);
      }
    }

    loggy.info('initialization complete');
  }

  XmlDocument secureRequest(XmlDocumentFragment content) =>
      SoapRequest.envelope(_securityHeader, content);

  XmlDocumentFragment get _securityHeader {
    final authorization =
        Authorization(password: password, timeDelta: timeDelta);

    final security = SoapRequest.security(
        username: username,
        password: authorization.digest,
        nonce: authorization.nonce,
        created: authorization.timeStamp);

    return SoapRequest.header(security);
  }

  /* for testing:
        , postProcess: (String xmlBody, dynamic jsonMap, Envelope envelope) {
      print(xmlBody);
      print('\n\n');
      print(jsonMap);
    } */
}
