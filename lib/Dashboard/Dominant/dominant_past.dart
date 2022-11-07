import 'dart:async';
import 'dart:math';

import 'package:demo/Utils/asset_files.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../Utils/app_theme.dart';

class DominantPast extends StatefulWidget {
  const DominantPast({Key? key}) : super(key: key);


  @override
  State<DominantPast> createState() => _DominantPastState();
}

class _DominantPastState extends State<DominantPast>{

  TrackballBehavior? _trackballBehavior;
  @override
  void initState() {
    _trackballBehavior = TrackballBehavior(
        enable: true,
        activationMode: ActivationMode.singleTap,
        tooltipSettings: const InteractiveTooltip(format: 'point.x : point.y'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5,),

          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Container(

              decoration: BoxDecoration(
                // border: Border.all(),
                  color: ColorsForApp.blackVeryLightColor,
                  borderRadius: BorderRadius.circular(10.0)
              ),
              // height: 190,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0,left: 3,bottom: 3.0),
                    child: Text("Emotion Vs Days",style: StyleForApp.textStyle13NormalWhite,),
                  ),
                  SizedBox(
                    height: 180,
                      child: _buildMultiColorLineChart()
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 70,),
        ],
      ),
    );
  }
  ///Get the chart with multi colored line series
  SfCartesianChart _buildMultiColorLineChart() {
    return SfCartesianChart(
     // title: ChartTitle(text:  'Annual rainfall of Paris'),
      plotAreaBorderWidth: 0,
      primaryXAxis: DateTimeAxis(
          intervalType: DateTimeIntervalType.days,
          dateFormat: DateFormat('yyyy-MM-dd'),
          majorGridLines: const MajorGridLines(width: 0),
          title: AxisTitle(text:  'Days',textStyle: TextStyle(color: Colors.grey,fontSize: 13))),
      primaryYAxis: NumericAxis(
          minimum: 0,
          maximum: 7,
          interval: 1,
          axisLine: const AxisLine(width: 0),
         // labelFormat: '{value}mm',
          majorTickLines: const MajorTickLines(size: 0)),
      series: _getMultiColoredLineSeries(),
      trackballBehavior: _trackballBehavior,
    );
  }
  ///Get multi colored line series
  List<LineSeries<_ChartData, DateTime>> _getMultiColoredLineSeries() {
    return <LineSeries<_ChartData, DateTime>>[
      LineSeries<_ChartData, DateTime>(
          animationDuration: 2500,
          dataSource: <_ChartData>[
            _ChartData(
                DateTime(1925), 4, const Color.fromRGBO(248, 184, 131, 1)),
            _ChartData(
                DateTime(1926), 4, const Color.fromRGBO(248, 184, 131, 1)),
            _ChartData(
                DateTime(1927), 4, const Color.fromRGBO(248, 184, 131, 1)),
            _ChartData(
                DateTime(1928), 3, const Color.fromRGBO(248, 184, 131, 1)),
            _ChartData(
                DateTime(1929), 6, const Color.fromRGBO(248, 184, 131, 1)),
            _ChartData(
                DateTime(1930), 4, const Color.fromRGBO(248, 184, 131, 1)),
            _ChartData(
                DateTime(1931), 3, const Color.fromRGBO(229, 101, 144, 1)),
            _ChartData(
                DateTime(1932), 2, const Color.fromRGBO(229, 101, 144, 1)),
            _ChartData(
                DateTime(1933), 1, const Color.fromRGBO(229, 101, 144, 1)),
            _ChartData(
                DateTime(1934), 7, const Color.fromRGBO(229, 101, 144, 1)),
            _ChartData(
                DateTime(1935), 5, const Color.fromRGBO(229, 101, 144, 1)),
            _ChartData(
                DateTime(1936), 6, const Color.fromRGBO(53, 124, 210, 1)),
            _ChartData(
                DateTime(1937), 2, const Color.fromRGBO(53, 124, 210, 1)),
            _ChartData(
                DateTime(1938), 3, const Color.fromRGBO(53, 124, 210, 1)),
            _ChartData(
                DateTime(1939), 5, const Color.fromRGBO(53, 124, 210, 1)),
            _ChartData(
                DateTime(1940), 5, const Color.fromRGBO(53, 124, 210, 1)),
            _ChartData(
                DateTime(1941), 3, const Color.fromRGBO(0, 189, 174, 1)),
            _ChartData(
                DateTime(1942), 3, const Color.fromRGBO(0, 189, 174, 1)),
            _ChartData(
                DateTime(1943), 4, const Color.fromRGBO(0, 189, 174, 1)),
            _ChartData(
                DateTime(1944), 4, const Color.fromRGBO(0, 189, 174, 1)),
            _ChartData(
                DateTime(1945), 5, const Color.fromRGBO(0, 189, 174, 1))
          ],
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y,

          /// The property used to apply the color each data.
          pointColorMapper: (_ChartData sales, _) => sales.lineColor,
          width: 2)
    ];
  }

}


class _ChartData {
  _ChartData(this.x, this.y, [this.lineColor]);
  final DateTime x;
  final double y;
  final Color? lineColor;
}