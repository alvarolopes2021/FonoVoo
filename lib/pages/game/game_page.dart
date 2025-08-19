import 'package:flutter/material.dart';
import 'package:fonovoo/pages/base_page.dart';
import 'package:fonovoo/pages/game/presenters/game_page_presenter.dart';

class GamePage extends BasePage {
  GamePage({super.key, required super.presenter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        title: ListenableBuilder(
          listenable: (presenter as GamePagePresenter),
          builder: (pageContext, snapshot) {
            return Text(
              (presenter as GamePagePresenter).minutesLeft.toString(),
            );
          },
        ),
      ),
      body: Container(
        color: Color.fromRGBO(0, 90, 152, 1),
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio:
                    (MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height * 0.8)),
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(color: Colors.red),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(color: Colors.green),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(color: Colors.blue),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(color: Colors.yellow),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.09,
              width: MediaQuery.of(context).size.height * 0.8,
              child: Container(
                margin: EdgeInsets.all(10),
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor:
                        Colors.blue, // Set the background color here
                  ),
                  child: Text("Finalizar"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
