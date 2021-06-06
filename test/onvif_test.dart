import 'package:easy_onvif/onvif.dart';
import 'package:test/test.dart';

void main() {
  test('Onvif should not be null', () {
    final onvif = Onvif(host: '', username: '', password: '');

    expect(onvif.username, '');
  });
}
