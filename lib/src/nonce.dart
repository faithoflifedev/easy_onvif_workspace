import 'dart:convert';
import 'dart:math' as math;
import 'dart:typed_data';

class Nonce {
  final int size;

  final math.Random random = math.Random();

  late final Uint8List bytes =
      Uint8List.fromList(List<int>.generate(size, (i) => random.nextInt(256)));

  Nonce({this.size = 16});

  String toBase64() => base64.encode(bytes.toList());

  @override
  String toString() => bytes
      .map((element) => element.toRadixString(16).padLeft(2, '0'))
      .toList()
      .join();
}
