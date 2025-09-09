import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class FlChartComponent extends StatefulWidget {
  final LineChartData seriesList;
  final String chartName;

  const FlChartComponent({
    super.key,
    required this.seriesList,
    required this.chartName,
  });

  @override
  State<StatefulWidget> createState() {
    return _FlChartComponent();
  }
}

class _FlChartComponent extends State<FlChartComponent> {
  @override
  Widget build(BuildContext context) {
    return LineChart(widget.seriesList);
  }
}
