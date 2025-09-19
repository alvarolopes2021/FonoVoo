import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';
import 'package:fonovoo/domain/dtos/students_category_dto.dart';

class CommunityChartsMultilneComponent extends StatefulWidget {
  final List<charts.Series<StudentsCategoryDto, double>> seriesList;
  final String chartName;
  final String domainName;

  const CommunityChartsMultilneComponent({
    super.key,
    required this.seriesList,
    required this.chartName,
    required this.domainName,
  });

  @override
  State<StatefulWidget> createState() {
    return _CommunityChartsMultilneComponent();
  }
}

class _CommunityChartsMultilneComponent
    extends State<CommunityChartsMultilneComponent> {
  String selection = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: charts.LineChart(
            widget.seriesList,
            animate: false,
            selectionModels: [
              charts.SelectionModelConfig(
                type: charts.SelectionModelType.info,
                changedListener: _onSelectionChanged,
              ),
            ],
            behaviors: [
              charts.ChartTitle(
                widget.chartName,
                titleStyleSpec: charts.TextStyleSpec(color: charts.Color.white),
                behaviorPosition: charts.BehaviorPosition.top,
                titleOutsideJustification:
                    charts.OutsideJustification.middleDrawArea,
              ),
            ],
            domainAxis: charts.NumericAxisSpec(
              showAxisLine: true,
              tickFormatterSpec: charts.BasicNumericTickFormatterSpec((value) {
                return "${widget.domainName} ${value!.toStringAsFixed(0)} ";
              }),
              renderSpec: charts.GridlineRendererSpec(
                labelStyle: charts.TextStyleSpec(
                  color: charts.MaterialPalette.white, // X-axis label color
                ),
                lineStyle: charts.LineStyleSpec(
                  color: charts.MaterialPalette.white, // X-axis line color
                ),
                axisLineStyle: charts.LineStyleSpec(
                  color: charts.MaterialPalette.white, // X-axis line color
                ),
              ),
            ),
            primaryMeasureAxis: charts.NumericAxisSpec(
              showAxisLine: true,
              renderSpec: charts.GridlineRendererSpec(
                labelStyle: charts.TextStyleSpec(
                  color: charts.MaterialPalette.white, // X-axis label color
                ),
                lineStyle: charts.LineStyleSpec(
                  color: charts.MaterialPalette.white, // X-axis line color
                ),
              ),
            ),
            defaultRenderer: charts.LineRendererConfig(
              includePoints: true,
              includeArea: true,
              includeLine: true,
              radiusPx: 4,
            ),
          ),
        ),
        Text(selection, style: TextStyle(color: Colors.white)),
      ],
    );
  }

  _onSelectionChanged(charts.SelectionModel<num> model) {
    final List<charts.SeriesDatum> selectedDatum = model.selectedDatum;

    if (selectedDatum.isNotEmpty) {
      setState(() {
        selection = (selectedDatum[0].datum as StudentsCategoryDto)
            .getGrade()
            .toString();
      });
    }
  }
}
