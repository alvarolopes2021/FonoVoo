import 'package:flutter/material.dart';

import 'package:fonovoo/core/helpers/material_charts_converter.dart';
import 'package:fonovoo/pages/base_page.dart';
import 'package:fonovoo/pages/components/multiline_chart_component.dart';
import 'package:fonovoo/pages/gamestatus/presenters/game_status_presenter.dart';

class GameStatusPage extends BasePage {
  GameStatusPage({super.key, required super.presenter});

  @override
  Widget build(BuildContext context) {
    (super.presenter as GameStatusPresenter).updateDto(
      ModalRoute.of(context)!.settings.arguments,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Estatísticas da partida"),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(0.8, 1),
            colors: <Color>[
              Color.fromRGBO(0, 90, 152, 1),
              Color.fromRGBO(0, 100, 162, 1),
              Color.fromRGBO(0, 110, 172, 1),
            ], // Gradient from,
          ),
        ),
        child: ListenableBuilder(
          listenable: (presenter as GameStatusPresenter),
          builder: (pageContext, snapshot) {
            return Column(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(15),
                    child: MultilineChartComponent(
                      seriesList:
                          MaterialChartsConverter.buildStudentsLineChartData(
                            (presenter as GameStatusPresenter)
                                .studentsCategoryDto,
                          ),
                      chartName: "Partida",
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.all(15),
                  child: TextButton.icon(
                    style: ButtonStyle(
                      elevation: WidgetStateProperty.all(2),
                      shadowColor: WidgetStateProperty.all(Colors.yellow),
                      backgroundColor: WidgetStateProperty.all(Colors.white),
                    ),
                    onPressed: () {
                      (presenter as GameStatusPresenter).goToSchoolsPage();
                    },
                    icon: Icon(Icons.check, color: Colors.blue),
                    label: Text(
                      "Finalizar",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
