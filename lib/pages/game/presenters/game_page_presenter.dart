import 'dart:async';

import 'package:fonovoo/pages/base_presenter.dart';

class GamePagePresenter extends BasePresenter {
  static String pageName = "/game-page";

  late Timer _timer;

  Duration minutesLeft = Duration(minutes: 35);

  GamePagePresenter({required super.pageContext}) {
    _timer = Timer.periodic(const Duration(seconds: 1), handleTimeout);
  }

  void handleTimeout(Timer timer) async {
    minutesLeft -= Duration(seconds: 1);
    notifyListeners();
  }
}
