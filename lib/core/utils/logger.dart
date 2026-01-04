import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';

void logi(String message, {StackTrace? stackTrace, String? tag}) {
  if (kDebugMode) {
    final timestamp = DateTime.now().toIso8601String();
    final tagStr = tag != null ? '[$tag] ' : '';
    final fullMessage = '[$timestamp] $tagStr$message';

    debugPrintSynchronously(fullMessage);

    developer.log(
      message,
      time: DateTime.now(),
      name: tag ?? 'Inure',
      stackTrace: stackTrace,
    );

    if (stackTrace != null) {
      debugPrintSynchronously('Stack trace:\n$stackTrace');
    }
  }
}

void logError(String message, {Object? error, StackTrace? stackTrace, String? tag, List<String>? values}) {
  if (kDebugMode) {
    final timestamp = DateTime.now().toIso8601String();
    final tagStr = tag != null ? '[$tag] ' : '';
    final errorStr = error != null ? '\nError: $error' : '';
    final valuesStr = values?.join(', ');
    final fullMessage = '[$timestamp] 🔴 ERROR $tagStr$message$errorStr\t($valuesStr)';

    debugPrintSynchronously(fullMessage);

    developer.log(
      message,
      time: DateTime.now(),
      name: tag ?? 'Inure',
      error: error,
      stackTrace: stackTrace ?? StackTrace.current,
      level: 1000,
    );

    if (stackTrace != null) {
      debugPrintSynchronously('Stack trace:\n$stackTrace');
    }
  }
}

void logWarning(String message, {String? tag}) {
  if (kDebugMode) {
    final timestamp = DateTime.now().toIso8601String();
    final tagStr = tag != null ? '[$tag] ' : '';
    final fullMessage = '[$timestamp] ⚠️ WARNING $tagStr$message';

    debugPrintSynchronously(fullMessage);

    developer.log(
      message,
      time: DateTime.now(),
      name: tag ?? 'Inure',
      level: 900,
    );
  }
}
