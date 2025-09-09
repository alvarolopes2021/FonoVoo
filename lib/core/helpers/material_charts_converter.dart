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
      chartSeries.add(
        PieChartData(
          label: element.key,
          value: element.value.reduce((value, element) => value + element),
        ),
      );
    }

    return chartSeries;
  }
}
