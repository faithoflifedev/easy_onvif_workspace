import 'package:easy_onvif/soap.dart';
import 'package:loggy/loggy.dart';

class Operation with UiLoggy {
  final Transport transport;

  final Uri uri;

  Operation({required this.transport, required this.uri});
}
