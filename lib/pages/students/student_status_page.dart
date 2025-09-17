import 'package:flutter/material.dart';
import 'package:fonovoo/core/helpers/material_charts_converter.dart';
import 'package:fonovoo/pages/base_page.dart';
import 'package:fonovoo/pages/components/center_message_with_icon_component.dart';
import 'package:fonovoo/pages/components/material_pie_chart_component.dart';
import 'package:fonovoo/pages/components/multiline_chart_component.dart';
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
                Text(
                  "Nota das partidas",
                  style: TextStyle(color: Colors.white),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(15),
                    child: MultilineChartComponent(
                      seriesList:
                          MaterialChartsConverter.buildStudentsLineChartDataByMatch(
                            (presenter as StudentsStatusPresenter)
                                .studentsCategoryDto,
                          ),
                      chartName: "Partida",
                    ),
                  ),
                ),
                Text(
                  "Parcial dos tópicos trabalhados",
                  style: TextStyle(color: Colors.white),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(15),
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
                  margin: EdgeInsets.fromLTRB(20, 0, 0, 50),
                  child: Row(
                    children: [
                      Icon(Icons.warning, color: Colors.white),
                      Text(
                        "As parciais indicam dificuldade em: ",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        "Frases",
                        style: TextStyle(
                          color: Colors.white,
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
