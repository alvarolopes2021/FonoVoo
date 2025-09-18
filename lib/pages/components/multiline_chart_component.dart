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
      enableZoom: true,
      enablePan: true,
      onPointTap: (value) {},
      style: MultiLineChartStyle(
        crosshair: CrosshairConfig(
          enabled: true,
          lineColor: Colors.grey,
          lineWidth: 1.0,
          showLabel: true,
        ),
        showLegend: true,
        backgroundColor: Colors.transparent,
        gridColor: Colors.white,
        gridLineWidth: 1,
        forceYAxisFromZero: true,
        tooltipStyle: MultiLineTooltipStyle(
          backgroundColor: Colors.black,
          borderRadius: 5,
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          padding: 8.0,
        ),
        colors: [
          Colors.red,
          Colors.yellow,
          Colors.green,
          Colors.white,
          Colors.blueAccent,
          Colors.deepOrange,
          Colors.brown,
          Colors.black,
        ],
      ),
    );
  }
}
