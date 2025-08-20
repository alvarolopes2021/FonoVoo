import 'dart:async';

import 'package:fonovoo/domain/dtos/students_dto.dart';
import 'package:fonovoo/pages/base_presenter.dart';

class GamePagePresenter extends BasePresenter {
  static String pageName = "/game-page";

  late Timer _timer;

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

  void handleTimeout(Timer timer) async {
    minutesLeft -= Duration(seconds: 1);
    if (minutesLeft == Duration(minutes: 0, seconds: 0)){
      _timer.cancel();
    }
    notifyListeners();
  }
}
