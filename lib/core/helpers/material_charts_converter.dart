import 'package:fonovoo/domain/dtos/students_category_dto.dart';
import 'package:material_charts/material_charts.dart';

class MaterialChartsConverter {
  static List<ChartSeries> buildStudentsLineChartData(
    List<StudentsCategoryDto> data,
  ) {
    List<ChartSeries> chartSeries = [
      ChartSeries(
        name: "Messi",
        dataPoints: [
          ChartDataPoint(value: 23),
          ChartDataPoint(value: 29),
          ChartDataPoint(value: 40),
        ],
      ),
      ChartSeries(
        name: "Ronaldo",
        dataPoints: [
          ChartDataPoint(value: 9),
          ChartDataPoint(value: 14),
          ChartDataPoint(value: 38),
        ],
      ),
      ChartSeries(
        name: "Ibra",
        dataPoints: [
          ChartDataPoint(value: 10),
          ChartDataPoint(value: 15),
          ChartDataPoint(value: 29),
        ],
      ),
      ChartSeries(
        name: "Mbappe",
        dataPoints: [
          ChartDataPoint(value: 22),
          ChartDataPoint(value: 19),
          ChartDataPoint(value: 39),
        ],
      ),
    ];

    return chartSeries;
  }
}
