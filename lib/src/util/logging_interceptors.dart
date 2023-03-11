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

    handler.next(options);
  }

  @override
  FutureOr<dynamic> onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) {
    loggy.error('ERROR:\n$err');

    handler.next(err);
  }

  @override
  FutureOr<dynamic> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    loggy.debug('RESPONSE:\n${response.data}');

    handler.next(response);
  }
}
