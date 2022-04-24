import 'package:dio/dio.dart';

extension UsageExtension on DioError {
  String get usage {
    return response?.data['error']['errors'] == null
        ? message
        : response!.data['error']['errors'].toString();
  }
}
