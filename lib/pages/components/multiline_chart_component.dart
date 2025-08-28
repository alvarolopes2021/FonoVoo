import 'package:flutter/material.dart';
import 'package:material_charts/material_charts.dart';

class MultilineChartComponent extends StatefulWidget {
  final List<ChartSeries> seriesList;
  final String chartName;

  const MultilineChartComponent({
    super.key,
    required this.seriesList,
    required this.chartName,
  });

  @override
  State<StatefulWidget> createState() {
    return _MultilineChartComponent();
  }
}

class _MultilineChartComponent extends State<MultilineChartComponent> {
  @override
  Widget build(BuildContext context) {
    return MultiLineChart(
      series: widget.seriesList,
      style: MultiLineChartStyle(
        backgroundColor: Colors.transparent,
        gridColor: Colors.white,
        gridLineWidth: 1,
        tooltipStyle: MultiLineTooltipStyle(
          borderRadius: 5,
          textStyle: TextStyle(color: Colors.white),
        ),
        colors: [Colors.black, Colors.red, Colors.blueAccent],
      ),
    );
  }
}
