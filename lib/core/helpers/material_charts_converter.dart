import 'package:fonovoo/domain/dtos/students_category_dto.dart';
import 'package:material_charts/material_charts.dart';

class MaterialChartsConverter {
  static List<ChartSeries> buildStudentsLineChartData(
    List<StudentsCategoryDto> data,
  ) {
    Map<String, List<double>> group = {};

    for (StudentsCategoryDto element in data) {
      if (group.containsKey(element.getStudentName())) {
        group[element.getStudentName()]!.add(element.getGrade());
      } else {
        group.addAll({
          element.getStudentName(): [element.getGrade()],
        });
      }
    }
    List<ChartSeries> chartSeries = [];

    for (var element in group.entries) {
      if (element.value.length == 1) {
        element.value.add(1);
      }
      chartSeries.add(
        ChartSeries(
          name: element.key,
          dataPoints: List.generate(
            element.value.length,
            (index) => ChartDataPoint(
              value: element.value[index],
              label: "Rodada ${(index + 1)}",
            ),
          ),
        ),
      );
    }

    return chartSeries;
  }

  static List<ChartSeries> buildStudentsLineChartDataByMatch(
    List<StudentsCategoryDto> data,
  ) {
    Map<String, List<double>> group = {};

    for (StudentsCategoryDto element in data) {
      if (group.containsKey(element.getMatchId())) {
        group[element.getMatchId()]!.add(element.getGrade());
      } else {
        group.addAll({
          element.getMatchId(): [element.getGrade()],
        });
      }
    }
    List<ChartSeries> chartSeries = [];

    Map<String, double> average = {};
    for (var element in group.entries) {
      if (element.value.length == 1) {
        element.value.add(1);
      }
      if (average.containsKey(element.key)) {
        average[element.key] = element.value.reduce(
          (value, element) => value + element,
        );
      } else {
        average.addAll({
          element.key: element.value.reduce(
            (value, element) => value + element,
          ),
        });
      }
    }

    if (average.length == 1) {
      average.addAll({"1": 1});
    }

    chartSeries.add(
      ChartSeries(
        name: "Nota",
        dataPoints: List.generate(
          average.values.length,
          (index) => ChartDataPoint(
            label: "Partida $index",
            value: average.values.toList()[index],
          ),
        ),
      ),
    );

    return chartSeries;
  }

  static List<ChartSeries> buildCategoriesLineChartData(
    List<StudentsCategoryDto> data,
  ) {
    Map<String, List<double>> group = {};

    for (StudentsCategoryDto element in data) {
      if (group.containsKey(element.getCategoryName())) {
        group[element.getCategoryName()]!.add(element.getGrade());
      } else {
        group.addAll({
          element.getCategoryName(): [element.getGrade()],
        });
      }
    }
    List<ChartSeries> chartSeries = [];

    for (var element in group.entries) {
      chartSeries.add(
        ChartSeries(
          name: element.key,
          dataPoints: List.generate(
            element.value.length,
            (index) => ChartDataPoint(
              value: element.value[index],
              label: "Rodada ${(index + 1)}",
            ),
          ),
        ),
      );
    }

    return chartSeries;
  }

  static List<PieChartData> buildCategoriesPieChartData(
    List<StudentsCategoryDto> data,
  ) {
    Map<String, List<double>> group = {};

    for (StudentsCategoryDto element in data) {
      if (group.containsKey(element.getCategoryName())) {
        group[element.getCategoryName()]!.add(element.getGrade());
      } else {
        group.addAll({
          element.getCategoryName(): [element.getGrade()],
        });
      }
    }
    List<PieChartData> chartSeries = [];

    for (var element in group.entries) {
      double grade = element.value.reduce((value, element) => value + element);
      chartSeries.add(PieChartData(label: element.key, value: grade));
    }

    return chartSeries;
  }
}
