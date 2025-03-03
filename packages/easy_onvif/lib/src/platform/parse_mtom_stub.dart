import 'dart:typed_data';

import 'package:dio/dio.dart';

String parseMtom(Response<Uint8List> response, {String? writeLogToFolder}) =>
    throw UnsupportedError('Cannot parse MTOM in this platform.');
