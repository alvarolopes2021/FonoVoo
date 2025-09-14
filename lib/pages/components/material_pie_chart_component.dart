import 'package:flutter/material.dart';
import 'package:fonovoo/domain/domain_services/category_color_converter.dart';
import 'package:material_charts/material_charts.dart';

class MaterialPieChartComponent extends StatefulWidget {
  final List<PieChartData> seriesList;
  final String chartName;

  const MaterialPieChartComponent({
    super.key,
    required this.seriesList,
    required this.chartName,
  });

  @override
  State<StatefulWidget> createState() {
    return _MaterialPieChartComponent();
  }
}

class _MaterialPieChartComponent extends State<MaterialPieChartComponent> {
  @override
  Widget build(BuildContext context) {
    return MaterialPieChart(
      data: widget.seriesList,
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.width * 0.7,
      minSizePercent: 0.0,
      chartRadius: MediaQuery.of(context).size.width * 0.4,
      style: PieChartStyle(
        defaultColors: List.generate(widget.seriesList.length, (index) {
          return CategoryColorConverter.stringToColor(
            widget.seriesList[index].label,
          );
        }),
        backgroundColor: Colors.transparent,
        startAngle: -180.0,
        holeRadius: 0.00,
        animationDuration: Duration(milliseconds: 2000),
        animationCurve: Curves.easeOutCubic,
        showLabels: true,
        showValues: true,
        labelOffset: 0.0,
        showLegend: false,
        legendPosition: PieChartLegendPosition.right,
        labelPosition: LabelPosition.outside,
        showConnectorLines: true,
        connectorLineColor: Colors.white,
        connectorLineStrokeWidth: 1.0,
        chartAlignment: ChartAlignment.center,
        labelStyle: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w600),
        valueStyle: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w700),
      ),
      interactive: true,
      showLabelOnlyOnHover: false,
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
      onAnimationComplete: () {
        print('Market Share Analysis animation completed!');
      },
    );
  }
}
