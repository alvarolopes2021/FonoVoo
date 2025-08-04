import 'package:flutter/material.dart';

abstract class Command<T> extends ChangeNotifier {
  Command();

  bool _running = false;

  /// True when the action is running.
  bool get running => _running;

  Result? _result;

  /// true if action completed with error
  bool get error => _result == Result.Error;

  /// true if action completed successfully
  bool get completed => _result == Result.Ok;

  /// Get last action result
  Result? get result => _result;

  /// Clear last action result
  void clearResult() {
    _result = null;
    notifyListeners();
  }

  /// Internal execute implementation
  Future<void> _execute(Function action) async {
    // Ensure the action can't launch multiple times.
    // e.g. avoid multiple taps on button
    if (_running) return;

    // Notify listeners.
    // e.g. button shows loading state
    _running = true;
    _result = null;
    notifyListeners();

    try {
      _result = await action();
    } finally {
      _running = false;
      notifyListeners();
    }
  }
}

class Command0<T> extends Command<T> {
  Command0(this._action);

  final Function _action;

  /// Executes the action.
  Future<void> execute() async {
    await _execute(_action);
  }
}

enum Result { Ok, Error, Running }
