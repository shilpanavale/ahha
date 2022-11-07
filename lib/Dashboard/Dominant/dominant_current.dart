import 'dart:async';
import 'dart:math';

import 'package:demo/Utils/asset_files.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../Utils/app_theme.dart';

class DominantCurrent extends StatefulWidget {
  const DominantCurrent({Key? key}) : super(key: key);


  @override
  State<DominantCurrent> createState() => _DominantCurrentState();
}

class _DominantCurrentState extends State<DominantCurrent>{
  Timer? _timer;
  List<_ChartData>? _chartData;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getChartData();
  }
  @override
  Widget build(BuildContext context) {


    // TODO: implement build
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
// border: Border.all(),
                      color: ColorsForApp.blackLightColor,
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    decoration: BoxDecoration(
// border: Border.all(),
                        color: ColorsForApp.blackVeryLightColor,
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                       // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Current month",style: StyleForApp.textStyle13NormalWhite),
                          SizedBox(height: 10,),
                          Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("August 2022",style: StyleForApp.subHeadline),
                                ],
                              )),


                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8,),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
// border: Border.all(),
                      color: ColorsForApp.blackLightColor,
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    decoration: BoxDecoration(
// border: Border.all(),
                        color: ColorsForApp.blackVeryLightColor,
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Dominant Emotion",style: StyleForApp.textStyle13NormalWhite),
                          SizedBox(height: 10,),
                          Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                 Container(
                                   width: 45,height: 45,
                                   child: Image.asset(AssetsFiles.angry)
                                 )
                                ],
                              )),


                        ],
                      ),
                    ),

                  ),
                ),
              ),

            ],
          ),
          SizedBox(height: 5,),
          Container(

            decoration: BoxDecoration(
              // border: Border.all(),
                color: ColorsForApp.blackVeryLightColor,
                borderRadius: BorderRadius.circular(10.0)
            ),
           // height: 200,
            child:  SizedBox(
              height: 200,
              child: SfCartesianChart(
                  plotAreaBorderWidth: 0,
                  title: ChartTitle(text: 'Emotion Vs Days',alignment:ChartAlignment.near,textStyle: StyleForApp.textStyle13NormalWhite),
                  primaryXAxis: NumericAxis(
                      interval: 1,
                      minimum: 1,
                      maximum: 7,
                      title: AxisTitle(text:  'Days',textStyle: TextStyle(color: Colors.grey,fontSize: 13)),
                      majorGridLines: const MajorGridLines(width: 0)),
                  primaryYAxis: NumericAxis(
                      title: AxisTitle(text:  'Emotions',textStyle: TextStyle(color: Colors.grey,fontSize: 13)),
                      majorTickLines: const MajorTickLines(color: Colors.transparent),
                      axisLine: const AxisLine(width: 0),
                      interval: 1,
                      minimum: 1,
                      maximum: 7),
                  series: _getDefaultLineSeries()),
            ),
          ),
         // SizedBox(height: 70,),
        ],
      ),
    );
  }
  /// The method returns line series to chart.
  List<LineSeries<_ChartData, num>> _getDefaultLineSeries() {
    return <LineSeries<_ChartData, num>>[
      LineSeries<_ChartData, num>(
          dataSource: _chartData!,
          color: ColorsForApp.greenColor,
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y,
          markerSettings: const MarkerSettings(isVisible: true))
    ];
  }

  @override
  void dispose() {
    super.dispose();
    _chartData!.clear();
  }



  void _getChartData() {
    _chartData = <_ChartData>[];

    _chartData!.add(_ChartData(7,7));
    _chartData!.add(_ChartData(6,6));
    _chartData!.add(_ChartData(5,5));
    _chartData!.add(_ChartData(4,4));



  }
}


class _ChartData {
  _ChartData(this.x, this.y);
  final int x;
  final int y;
}
class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;

}