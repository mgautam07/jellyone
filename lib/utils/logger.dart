import 'package:logger/logger.dart';
import 'package:path/path.dart';

Future<Logger> customLogger(String supportDir) async {
  final logPath = join(supportDir, 'logs');
  var logger = Logger(
      printer: SimplePrinter(),
      output:
          MultiOutput([ConsoleOutput(), AdvancedFileOutput(path: logPath)]));

  return logger;
}
