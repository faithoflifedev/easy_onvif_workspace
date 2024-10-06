import 'dart:convert';

class Reason {
  final String? lang;

  final String? note;

  Reason({
    this.lang,
    this.note,
  });

  factory Reason.fromJson(Map<String, dynamic> json) =>
      Reason(lang: json['Text']['@xml:lang'], note: json['Text']['\$']);

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'lang': lang, 'note': note};

  @override
  String toString() => json.encode(toJson());
}
