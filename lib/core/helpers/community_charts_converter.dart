import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:fonovoo/domain/dtos/students_category_dto.dart';

class CommunityChartsConverter {
  static List<charts.Series<StudentsCategoryDto, double>>
  buildStudentsLineChartDataByMatch(List<StudentsCategoryDto> data) {
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

    Map<String, double> average = {};
    for (var element in group.entries) {
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

    List<StudentsCategoryDto> grades = [];
    int index = 1;
    for (var grade in average.entries) {
      grades.add(
        StudentsCategoryDto(
          index.toString(),
          "",
          "",
          "",
          grade.key,
          "",
          "",
          grade.value,
        ),
      );
      index++;
    }

    List<charts.Series<StudentsCategoryDto, double>> chartSeries = [
      charts.Series<StudentsCategoryDto, double>(
        seriesColor: charts.Color.fromHex(code: "#FF0000"),
        id: 'Nota',
        data: grades,
        domainFn: (StudentsCategoryDto datum, int? index) =>
            double.parse(datum.getId()),
        measureFn: (StudentsCategoryDto datum, int? index) => datum.getGrade(),
      ),
    ];

    return chartSeries;
  }
}
