import 'package:demo/Utils/app_theme.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
class ChangePage extends StatefulWidget {
  const ChangePage({Key? key}) : super(key: key);


  @override
  State<ChangePage> createState() => _ChangePageState();
}

class _ChangePageState extends State<ChangePage> {
  late List<ChartSampleData> data;
  late TooltipBehavior _tooltip;
  double progressValue = 8.3;
  final List<ChartSampleData> chartData = [

    ChartSampleData('Impact',  0),
    ChartSampleData('Physical Health',  20 ),
    ChartSampleData( 'Love & Relationships', 0),
    ChartSampleData('Physical Health', 12 ),
    ChartSampleData('Career & Finance',  8),
    ChartSampleData('Physical Health', 12 ),
    ChartSampleData('Personal Growth',  24),
  ];
  final List<ChartSampleData> chartData1 = [

    ChartSampleData('Impact',  -10),

    ChartSampleData( 'Love & Relationships',- 10),

  ];
  final List<Color> color = <Color>[
    Colors.green.shade100,
    Colors.green.shade200,
    Colors.green
  ];


  final List<double> stops = <double>[
    0.0,0.5,1.0
  ];



  @override
  void initState(){

    _tooltip = TooltipBehavior(enable: true);

    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: _buildStackedBarChart(),
        ),
      ],
    );
  }
  /// Reutrns the cartesian stacked bar chart.
  SfCartesianChart _buildStackedBarChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0.1,
      title: ChartTitle(text:  'Past life Aspect Vs',alignment:ChartAlignment.near,textStyle:  StyleForApp.textStyle13NormalWhite),
      // legend: Legend(isVisible: !isCardView),
      primaryXAxis: CategoryAxis(
        majorGridLines: const MajorGridLines(width: 0),
        title: AxisTitle(text:  'Life Aspects'),
      ),
      primaryYAxis: NumericAxis(
          axisLine: const AxisLine(width: 0),
          title: AxisTitle(text:  '%'),

          labelFormat: '{value}',

          majorTickLines: const MajorTickLines(size: 0)),
      series: _getStackedBarSeries(),
      tooltipBehavior: _tooltip,
    );
  }
  List<StackedBarSeries<ChartSampleData, String>> _getStackedBarSeries() {
    return <StackedBarSeries<ChartSampleData, String>>[
      StackedBarSeries<ChartSampleData, String>(
          dataSource: chartData,
          xAxisName: '%',
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          borderRadius: const BorderRadius.all(Radius.circular(1)),
          name: 'Past life Aspect Vs',
          color: ColorsForApp.greenColor),
      StackedBarSeries<ChartSampleData, String>(
          dataSource: chartData1,
          borderRadius: const BorderRadius.all(Radius.circular(1)),
          xAxisName: '%',
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          name: '',
          color: Colors.red),

    ];
  }
}
class ChartSampleData {
  ChartSampleData(this.x, this.y);
  final String x;
  final double y;
}