
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
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          name: 'Past life Aspect Vs',
          color: ColorsForApp.greenColor),
      StackedBarSeries<ChartSampleData, String>(
          dataSource: chartData1,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
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


class Past extends StatefulWidget {
  const Past({Key? key}) : super(key: key);


  @override
  State<Past> createState() => _PastPageState();
}

class _PastPageState extends State<Past> {
  late List<ChartSampleData> data;
  late TooltipBehavior _tooltip;
  double progressValue = 8.3;
  List<Color> gradientColors = [
    Colors.green,
    Colors.green.shade100,
  ];

  bool showAvg = false;



  @override
  Widget build(BuildContext context) {

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 10,),
      Text("Months Vs wellbeing index",style: StyleForApp.textStyle13NormalWhite,),
      const SizedBox(height: 10,),
      Expanded(
        child: Container(
          decoration: BoxDecoration(
            // border: Border.all(),
              color: ColorsForApp.blackVeryLightColor,
              borderRadius: BorderRadius.circular(10.0)
          ),

         // height: 160,
          width: MediaQuery.of(context).size.width,
          child:Padding(
            padding: const EdgeInsets.all(8.0),
            child: LineChart(
              mainData(),
            ),
          ),
              ),
      ),



    ],
  );
  }
  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.normal,
      fontSize: 12,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('May', style: style);
        break;
      case 2:
        text = const Text('June', style: style);
        break;
      case 4:
        text = const Text('July', style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 8,
      child: text,
    );
  }
  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.normal,
      fontSize: 12,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('0', style: style);
        break;
      case 1:
        text = const Text('1', style: style);
        break;
      case 2:
        text = const Text('2', style: style);
        break;
        case 3:
        text = const Text('3', style: style);
        break;
        case 4:
        text = const Text('4', style: style);
        break;
        case 5:
        text = const Text('5', style: style);
        break;
        case 6:
        text = const Text('6', style: style);
        break;
        case 7:
        text = const Text('7', style: style);
        break;
        case 8:
        text = const Text('8', style: style);
        break;
        case 9:
        text = const Text('9', style: style);
        break;
        case 10:
        text = const Text('10', style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 8,
      child: text,
    );
  }
  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: false,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 2,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 25,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 30,
          ),
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 4,
      minY: 0,
      maxY: 10,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 5.5),
            FlSpot(1.8, 8.5),
            FlSpot(4.0, 8),
           // FlSpot(6.8, 3.1),
            //FlSpot(8, 4),
            //FlSpot(9.5, 3),
            //FlSpot(10, 4),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
         // barWidth: 3,
         // isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ],
    );
  }

}

