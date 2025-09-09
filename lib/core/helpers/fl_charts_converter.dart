import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fonovoo/domain/dtos/students_category_dto.dart';

class FlChartsConverter {
  static LineChartData buildStudentsLineChartData(
    List<StudentsCategoryDto> data,
  ) {
    LineChartData lineChartData = LineChartData();

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

    List<LineChartBarData> studentsStatistic = [];

    for (var element in group.entries) {
      studentsStatistic.add(
        LineChartBarData(
          color: Colors.red,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(show: false),
          belowBarData: BarAreaData(show: false),
          spots: List.generate(element.value.length, (index) {
            return FlSpot(double.parse(index.toString()), element.value[index]);
          }),
        ),
      );
    }

    lineChartData = LineChartData(
      titlesData: FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 32,
            interval: 1,
            getTitlesWidget: (value, meta) {
              return Text(value.toString());
            },
          ),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            getTitlesWidget: (value, meta) {
              return Text(value.toString());
            },
            showTitles: true,
            interval: 1,
            reservedSize: 40,
          ),
        ),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      ),
      lineBarsData: studentsStatistic,
      minX: 0,
      maxX: double.parse(group.entries.length.toString()),
      maxY: double.parse(group.entries.length.toString()),
      minY: 0,
    );

    return lineChartData;
  }
}
