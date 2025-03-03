import 'package:xml/xml.dart';

abstract class XmlSerializable {
  void buildXml(XmlBuilder builder, {String tag, String? namespace});
}
