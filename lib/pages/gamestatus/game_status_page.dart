import 'package:flutter/material.dart';

import 'package:fonovoo/pages/base_page.dart';
import 'package:fonovoo/pages/gamestatus/presenters/game_status_presenter.dart';

class GameStatusPage extends BasePage {
  GameStatusPage({super.key, required super.presenter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListenableBuilder(
        listenable: (presenter as GameStatusPresenter),
        builder: (pageContext, snapshot) {
          return Text("");
        },
      ),
    );
  }
}
