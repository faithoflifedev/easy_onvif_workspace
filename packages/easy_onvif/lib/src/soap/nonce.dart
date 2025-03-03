import 'dart:convert' show base64;
import 'dart:math' show Random;

class Nonce {
  /// During testing use user generated bytes so that results can be validated.
  final List<int>? bytesOverride;

  late final List<int> bytes;

  Nonce({this.bytesOverride}) {
    bytes =
        bytesOverride ??
        List<int>.generate(
          16,
          (_) => Random.secure().nextInt(255),
          growable: false,
        );
  }

  String toBase64() => base64.encode(bytes);

  @override
  String toString() =>
      bytes
          .map((element) => element.toRadixString(16).padLeft(2, '0'))
          .toList()
          .join();
}
