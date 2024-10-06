import 'dart:async';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:loggy/loggy.dart';

/// Dio instance may have one or more interceptors by which you can intercept
/// requests/responses/errors before they are handled by `then` or `catchError`.
class LoggingInterceptors extends Interceptor with UiLoggy {
  /// The callback will be executed before the request is initiated.
  @override
  FutureOr<dynamic> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    loggy.debug('\nURI: ${options.uri}');

    loggy.debug('\nREQUEST:\n${options.data}');

    super.onRequest(options, handler);
  }

  /// The callback will be executed on error.
  @override
  FutureOr<dynamic> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    loggy.error('\nERROR:\n$err');

    handler.next(err);
  }

  /// The callback will be executed on success.
  @override
  FutureOr<dynamic> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    if (response.data is! Uint8List) {
      loggy.debug('\nRESPONSE:\n${response.data}');
    } else {
      loggy.debug('\nRESPONSE:\n<Uint8List>');
    }

    super.onResponse(response, handler);
  }
}
