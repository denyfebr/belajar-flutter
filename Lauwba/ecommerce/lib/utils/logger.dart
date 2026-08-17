import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class AppLogger {
  final _logger = Logger(
      printer: PrettyPrinter(
        lineLength: 200,
        // Width of the output
        colors: true,
        // Colorful log messages
        printEmojis: true,
        // Print an emoji for each log message
        // Should each log print contain a timestamp
        dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
      ),
      level: kReleaseMode ? Level.off : Level.all // atur logging level, jika release maka off
  );

  AppLogger.i(String message) {
    _logger.i(message);
  }

  AppLogger.d(String message) {
    _logger.d(message);
  }

  AppLogger.e(String message) {
    _logger.e(message);
  }

  AppLogger.w(String message) {
    _logger.w(message);
  }


}
