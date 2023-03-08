import 'fault.dart';

class Body {
  final Fault? fault;

  final Map<String, dynamic>? response;

  bool get hasFault => fault != null;

  bool get success => fault == null;

  Body({
    this.fault,
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
}
