import 'dart:convert';
import 'dart:typed_data';

import 'package:http_parser/http_parser.dart';

class MtomPart {
  final MediaType mediaType;
  final String contentTransferEncoding;
  final String contentId;
  final Uint8List content;

  MtomPart({
    required this.mediaType,
    required this.contentTransferEncoding,
    required this.contentId,
    required this.content,
  });

  String get contentAsString => String.fromCharCodes(content);

  String get contentAsBase64 => base64.encode(content);

  List<int> get contentAsBytes => content;
}

class Mtom {
  static List<MtomPart> parse({
    required String boundary,
    required Uint8List response,
  }) {
    final parts = <MtomPart>[];

    final boundaryBytes = '--$boundary'.codeUnits;
    final crlfBytes = '\r\n'.codeUnits;

    var start = 0;
    var end = 0;

    while (end < response.length) {
      if (response[end] == crlfBytes[0] &&
          response[end + 1] == crlfBytes[1] &&
          response[end + 2] == boundaryBytes[0] &&
          response[end + 3] == boundaryBytes[1]) {
        if (start != end) {
          final part = response.sublist(start, end);
          parts.add(_parsePart(part));
        }

        start = end + 4;
        end = start;
      } else {
        end++;
      }
    }

    return parts;
  }

  static MtomPart _parsePart(Uint8List part) {
    final mediaType = MediaType.parse(_parseHeader('Content-Type', part));
    final contentTransferEncoding =
        _parseHeader('Content-Transfer-Encoding', part);
    final contentId = _parseHeader('Content-ID', part);
    final content = _parseContent(part);

    return MtomPart(
      mediaType: mediaType,
      contentTransferEncoding: contentTransferEncoding,
      contentId: contentId,
      content: content,
    );
  }

  static String _parseHeader(String headerName, Uint8List part) {
    final headerEncodingBytes = '$headerName: '.codeUnits;

    var start = _findPosition(part, headerEncodingBytes);

    if (start == -1) {
      return '';
    } else {
      start = start + headerEncodingBytes.length;
    }

    final end = _findPosition(part, '\r\n'.codeUnits, start);

    return String.fromCharCodes(part.sublist(start, end));
  }

  static Uint8List _parseContent(Uint8List part) {
    final start = _findPosition(part, '\r\n\r\n'.codeUnits);

    return part.sublist(start + 4);
  }

  static int _findPosition(
    Uint8List source,
    List<int> pattern, [
    int start = 0,
  ]) {
    if (pattern.isEmpty) {
      return -1;
    }

    for (int i = start; i <= source.length - pattern.length; i++) {
      if (source[i] == pattern[0]) {
        bool found = true;

        for (int j = 1; j < pattern.length; j++) {
          if (i + j >= source.length || source[i + j] != pattern[j]) {
            found = false;
            break;
          }
        }
        if (found) {
          return i;
        }
      }
    }
    return -1; // Not found/ Not found
  }
}
