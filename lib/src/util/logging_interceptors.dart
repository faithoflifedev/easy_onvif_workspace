import 'dart:async';

import 'package:dio/dio.dart';
import 'package:loggy/loggy.dart';

class LoggingInterceptors extends Interceptor with UiLoggy {
  @override
  FutureOr<dynamic> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    loggy.debug('URI: ${options.uri}');

    loggy.debug('REQUEST:\n${options.data}');
  }

  @override
  FutureOr<dynamic> onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) {
    loggy.error('ERROR:\n$err');
  }

  @override
  FutureOr<dynamic> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    loggy.debug('RESPONSE:\n${response.data}');
  }
}
