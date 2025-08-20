import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fonovoo/domain/dtos/students_dto.dart';
import 'package:fonovoo/pages/base_presenter.dart';

class GamePagePresenter extends BasePresenter {
  static String pageName = "/game-page";

  late Timer _timer;

  Map<Color, bool> grid = {
    Colors.red: false,
    Colors.green: false,
    Colors.blue: false,
    Colors.yellow: false,
  };

  Duration minutesLeft = Duration(minutes: 35, seconds: 1);

  GamePagePresenter({required super.pageContext}) {
    _timer = Timer.periodic(const Duration(seconds: 1), handleTimeout);
  }

  void updateDto(Object? school) {
    if (school == null) {
      return;
    }
    Map<String, List<StudentsDto>> groups = {};
  }

  void updateSelection(int index) {
    for (var key in grid.keys) {
      grid[key] = false;
    }
    Color selectedColor = grid.keys.toList()[index];
    grid[selectedColor] = !grid[selectedColor]!;
    notifyListeners();
  }

  void handleTimeout(Timer timer) async {
    minutesLeft -= Duration(seconds: 1);
    if (minutesLeft == Duration(minutes: 0, seconds: 0)) {
      _timer.cancel();
    }
    notifyListeners();
  }
}
