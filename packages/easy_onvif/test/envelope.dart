import 'dart:io';

import 'package:easy_onvif/src/model/envelope.dart' as env;

class Envelope extends env.Envelope {
  Envelope({super.header, required super.body});

  static env.Envelope fromXmlFile(String fileNameAndPath) =>
      env.Envelope.fromXmlString(File(fileNameAndPath).readAsStringSync());
}
