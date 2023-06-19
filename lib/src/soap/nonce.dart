import 'dart:convert' show base64;
import 'dart:math' show Random;
import 'dart:typed_data' show Uint8List;

/// implements the [Nonce] algorithm specified by the Onvif spec.
class Nonce {
  final int size;

  final Uint8List bytes;

  Nonce({this.size = 16})
      : bytes = Uint8List.fromList(
            List<int>.generate(size, (i) => Random().nextInt(255)));

  String toBase64() => base64.encode(bytes.toList());

  @override
  String toString() => bytes
      .map((element) => element.toRadixString(size).padLeft(2, '0'))
      .toList()
      .join();
}
