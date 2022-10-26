import 'package:loggy/loggy.dart';
import 'package:universal_io/io.dart';

class StdErrPrinter extends PrettyPrinter {
  const StdErrPrinter() : super();

  static const _defaultPrefix = '🤔 ';

  bool get _colorize => showColors ?? false;

  @override
  @override
  void onLog(LogRecord record) {
    final time = record.time.toIso8601String().split('T')[1];

    final callerFrame =
        record.callerFrame == null ? '-' : '(${record.callerFrame?.location})';

    final logLevel = record.level
        .toString()
        .replaceAll('Level.', '')
        .toUpperCase()
        .padRight(8);

    final color =
        _colorize ? levelColor(record.level) ?? AnsiColor() : AnsiColor();

    final prefix = levelPrefix(record.level) ?? _defaultPrefix;

    stderr.write(color(
        '$prefix$time $logLevel ${record.loggerName} $callerFrame ${record.message}\n'));

    if (record.stackTrace != null) {
      print('${record.stackTrace}\n');
    }
  }
}
