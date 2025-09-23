import 'package:flutter/material.dart';
import 'package:fonovoo/domain/domain_services/category_color_converter.dart';
import 'package:material_charts/material_charts.dart';

class MaterialStackedBarChartComponent extends StatefulWidget {
  final List<StackedBarData> seriesList;
  final String chartName;

  const MaterialStackedBarChartComponent({
    super.key,
    required this.seriesList,
    required this.chartName,
  });

  @override
  State<StatefulWidget> createState() {
    return _MaterialStackedBarChartComponent();
  }
}

class _MaterialStackedBarChartComponent
    extends State<MaterialStackedBarChartComponent> {
  @override
  Widget build(BuildContext context) {
    return MaterialStackedBarChart(
      data: widget.seriesList,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2,
      style: StackedBarChartStyle(
        backgroundColor: Colors.transparent,
        barSpacing: 0.50,
        cornerRadius: 0.0,
        labelStyle: TextStyle(fontSize: 14.2, fontWeight: FontWeight.w600),
        valueStyle: TextStyle(
          color: Colors.white,
          fontSize: 11.0,
          fontWeight: FontWeight.w700,
        ),
        animationDuration: Duration(milliseconds: 1500),
        animationCurve: Curves.bounceOut,
      ),
      showGrid: true,
      showValues: true,
      interactive: true,
      horizontalGridLines: 4,
      padding: EdgeInsets.all(10.0),
      onAnimationComplete: () {
        print('Website Traffic Sources animation completed!');
      },
    );
  }
}
