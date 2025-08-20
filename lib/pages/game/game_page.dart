import 'package:flutter/material.dart';
import 'package:fonovoo/pages/base_page.dart';
import 'package:fonovoo/pages/game/presenters/game_page_presenter.dart';

class GamePage extends BasePage {
  GamePage({super.key, required super.presenter});

  @override
  Widget build(BuildContext context) {
    (super.presenter as GamePagePresenter).updateDto(
      ModalRoute.of(context)!.settings.arguments,
    );

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: ListenableBuilder(
          listenable: (presenter as GamePagePresenter),
          builder: (pageContext, snapshot) {
            return Text(
              (presenter as GamePagePresenter).minutesLeft
                  .toString()
                  .split(".")
                  .first
                  .padLeft(8, "0"),
            );
          },
        ),
        actions: [
          Container(
            margin: EdgeInsets.all(10),
            child: TextButton.icon(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
                backgroundColor: Colors.white, // Set the background color here
              ),
              label: Text("Finalizar"),
              icon: Icon(Icons.flag),
            ),
          ),
        ],
      ),
      body: Container(
        color: Color.fromRGBO(0, 90, 152, 1),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width,
              child: DropdownButton<String>(
                items: [DropdownMenuItem(child: Text("Samuel"))],
                onChanged: (value) {},
                hint: Text("Jogador da vez"),
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio:
                    (MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height * 0.75)),
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
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: TextButton.icon(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor:
                              Colors.green, // Set the background color here
                        ),
                        label: Text("Confirmar"),
                        icon: Icon(Icons.check),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: TextButton.icon(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.blue,
                          backgroundColor:
                              Colors.white, // Set the background color here
                        ),
                        label: Text("Pular"),
                        icon: Icon(Icons.keyboard_arrow_right),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
