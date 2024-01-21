import 'dart:convert' show base64;
import 'dart:math' show Random;

class Nonce {
  final _random = Random.secure();

  final List<int>? bytesOverride;

  late final List<int> bytes;

  Nonce({this.bytesOverride}) {
    bytes = bytesOverride ??
        List<int>.generate(
          16,
          (_) => _random.nextInt(255),
          growable: false,
        );
  }

  String toBase64() => base64.encode(bytes);
}
