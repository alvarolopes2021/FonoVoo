import 'package:flutter/material.dart';
import 'package:fonovoo/pages/base_page.dart';
import 'package:fonovoo/pages/components/game_selector_component.dart';
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
              margin: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              child: DropdownMenu<String>(
                hintText: "Jogador da vez",
                width: MediaQuery.of(context).size.width,
                label: Text(
                  'Jogador da vez',
                  style: TextStyle(color: Colors.white),
                ),
                dropdownMenuEntries: List.generate(
                  (presenter as GamePagePresenter).allStudents.length,
                  (index) {
                    return DropdownMenuEntry<String>(
                      value: (presenter as GamePagePresenter).allStudents[index]
                          .getName(),
                      label: (presenter as GamePagePresenter).allStudents[index]
                          .getName(),
                    );
                  },
                ),
                textStyle: TextStyle(color: Colors.white),
                selectedTrailingIcon: Icon(
                  Icons.keyboard_arrow_up,
                  color: Colors.white,
                ),
                inputDecorationTheme: InputDecorationTheme(border: null),
                trailingIcon: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: ListenableBuilder(
                listenable: (presenter as GamePagePresenter),
                builder: (pageContext, snapshot) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      childAspectRatio:
                          (MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height * 0.70)),
                      children: List<Widget>.generate(
                        (presenter as GamePagePresenter).grid.length,
                        (index) {
                          return GameSelectorComponent(
                            categoryDto:
                                (presenter as GamePagePresenter).grid[index],
                            updateSelection: (presenter as GamePagePresenter)
                                .updateSelection,
                            index: index,
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(5),
                      child: TextButton.icon(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.blue,
                          backgroundColor:
                              Colors.white, // Set the background color here
                        ),
                        label: Text("Errou"),
                        icon: Icon(Icons.keyboard_arrow_right),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(5),
                      child: TextButton.icon(
                        onPressed: () {
                          (presenter as GamePagePresenter).gotIt();
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor:
                              Colors.green, // Set the background color here
                        ),
                        label: Text("Acertou"),
                        icon: Icon(Icons.check),
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
