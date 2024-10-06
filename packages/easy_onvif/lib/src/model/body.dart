import 'package:easy_onvif/shared.dart';
import 'package:easy_onvif/soap.dart' show Xmlns;
import 'package:xml/xml.dart';

import 'fault.dart';

class Body implements XmlSerializable {
  final Fault? fault;

  final XmlDocumentFragment? request;

  final Map<String, dynamic>? response;

  bool get hasFault => fault != null;

  bool get success => fault == null;

  Body({
    this.fault,
    this.request,
    this.response,
  });

  factory Body.fromJson(Map<String, dynamic> json) {
    final responseType = json.keys.firstWhere((key) => key != 'fault');

    final responseMap = json[responseType] as Map<String, dynamic>;

    return Body(
      fault: json['Fault'] == null ? null : Fault.fromJson(json['Fault']),
      response: responseMap.entries.isEmpty ? json : responseMap,
    );
  }

  @override
  void buildXml(
    XmlBuilder builder, {
    String tag = 'Body',
    String? namespace = Xmlns.s,
  }) {
    builder.element(
      tag,
      namespace: namespace,
      namespaces: {
        'http://www.w3.org/2001/XMLSchema-instance': 'xsi',
        Xmlns.xsd: 'xsd'
      },
      nest: request,
    );
  }
}
