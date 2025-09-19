import 'package:flutter/material.dart';
import 'package:fonovoo/core/helpers/community_charts_converter.dart';
import 'package:fonovoo/core/helpers/material_charts_converter.dart';
import 'package:fonovoo/pages/base_page.dart';
import 'package:fonovoo/pages/components/center_message_with_icon_component.dart';
import 'package:fonovoo/pages/components/community_charts_multilne_component.dart';
import 'package:fonovoo/pages/components/material_pie_chart_component.dart';
import 'package:fonovoo/pages/components/material_multiline_chart_component.dart';
import 'package:fonovoo/pages/students/presenters/students_status_presenter.dart';

class StudentStatusPage extends BasePage {
  StudentStatusPage({super.key, required super.presenter});

  @override
  Widget build(BuildContext context) {
    (super.presenter as StudentsStatusPresenter).updateDto(
      ModalRoute.of(context)!.settings.arguments,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          (presenter as StudentsStatusPresenter).selectedStudent.getName(),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(0.8, 1),
            colors: <Color>[
              Color.fromRGBO(60, 120, 172, 1),
              Color.fromRGBO(70, 130, 182, 1),
              Color.fromRGBO(80, 140, 192, 1),
            ], // Gradient from,
          ),
        ),
        child: ListenableBuilder(
          listenable: (presenter as StudentsStatusPresenter),
          builder: (pageContext, snapshot) {
            if ((presenter as StudentsStatusPresenter)
                .studentsCategoryDto
                .isEmpty) {
              return CenterMessageWithIconComponent(
                message: "O aluno ainda não jogou",
                icon: Icon(Icons.sentiment_dissatisfied, color: Colors.white),
              );
            }
            return Column(
              children: [
                (presenter as StudentsStatusPresenter)
                            .numberOfMatchesPlayed
                            .length ==
                        1
                    ? Text(
                        "O aluno jogou apenas 1 partida, mas um valor arbirtário foi inserido para mostrar o gráfico",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                        softWrap: true,
                        textAlign: TextAlign.center,
                      )
                    : Text(""),
                Text(
                  "Notas por partida",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(15, 0, 15, 15),
                    child: MaterialMultilineChartComponent(
                      seriesList:
                          MaterialChartsConverter.buildStudentsLineChartDataByMatch(
                            (presenter as StudentsStatusPresenter)
                                .studentsCategoryDto,
                          ),
                      chartName: "Nota das partidas",
                    ),
                  ),
                ),
                Text(
                  "Evolução dos tópicos",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(15, 0, 15, 15),
                    child: MaterialMultilineChartComponent(
                      seriesList:
                          MaterialChartsConverter.buildCategoriesLineChartData(
                            (presenter as StudentsStatusPresenter)
                                .studentsCategoryDto,
                          ),
                      chartName: "Nota das partidas",
                    ),
                  ),
                ),
                Text(
                  "Parcial dos tópicos trabalhados",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(15, 0, 15, 15),
                    child: MaterialPieChartComponent(
                      seriesList:
                          MaterialChartsConverter.buildCategoriesPieChartData(
                            (presenter as StudentsStatusPresenter)
                                .studentsCategoryDto,
                          ),
                      chartName: "Categorias",
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 50),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "As parciais indicam dificuldade em ",
                        style: TextStyle(color: Colors.yellow),
                      ),
                      Text(
                        (presenter as StudentsStatusPresenter).difficultSubject,
                        style: TextStyle(
                          color: Colors.yellow,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
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
