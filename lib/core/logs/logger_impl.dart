import 'package:fonovoo/core/logs/ilog_service.dart';

import 'package:flutter/foundation.dart';

class LoggerImpl implements Ilogservice {
  @override
  writeErrorMessage(String message) {
    if (kDebugMode) {
      debugPrint('DEBUG: $message');
    }
  }

  @override
  writeWarningMessage(String message) {
    if (kDebugMode) {
      debugPrint('DEBUG: $message');
    }
  }
}
