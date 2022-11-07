
import 'package:demo/Utils/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
class CurrentScore extends StatefulWidget {
  const CurrentScore({Key? key}) : super(key: key);


  @override
  State<CurrentScore> createState() => _CurrentScoreState();
}

class _CurrentScoreState extends State<CurrentScore>{
  late TooltipBehavior _tooltipBehavior;

  late List<ChartData> data;
  late TooltipBehavior _tooltip;
  @override
  void initState(){
    data = [
      ChartData('Personal Growth', 12),
      ChartData('Impact', 12),
      ChartData('Career & Finance', 30),
      ChartData('Love & Relationships', 30),
      ChartData('Physical Health ', 6.4),
      ChartData('Mental Health', 14)
    ];
    _tooltip = TooltipBehavior(enable: true);
    _tooltipBehavior =  TooltipBehavior(enable: true);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(

      child: Column(
        children: [
          const SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                    width: 135,
                    height: 80,
                    decoration: BoxDecoration(
                      // border: Border.all(),
                        color: ColorsForApp.blackVeryLightColor,
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('9.3',style: StyleForApp.textStyle14BoldGreen,),
                        const SizedBox(height: 5,),
                        Text('Total Wellbeing index',style: StyleForApp.textStyle13NormalWhite,),
                      ],
                    )
                ),
              ),
              const SizedBox(width: 5,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                      width: 135,
                      height: 80,
                      decoration: BoxDecoration(
                        // border: Border.all(),
                          color: ColorsForApp.blackVeryLightColor,
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('May 2022',style: StyleForApp.textStyle14BoldGreen,),
                          const SizedBox(height: 5,),
                          Text('Current month',style: StyleForApp.textStyle13NormalWhite,),
                        ],
                      )
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5,),
          Container(

            decoration: BoxDecoration(
              // border: Border.all(),
                color: ColorsForApp.blackVeryLightColor,
                borderRadius: BorderRadius.circular(10.0)
            ),
            // height: 190,
            child: SizedBox(
                height: 200,
                child: SfCartesianChart(
                    title: ChartTitle(text:  'Life Aspect Vs Score',alignment:ChartAlignment.near,textStyle:  StyleForApp.textStyle13NormalWhite),
                    primaryXAxis: CategoryAxis(
                      //Hide the gridlines of y-axis
                      majorGridLines: const MajorGridLines(width: 0),
                      //Hide the axis line of y-axis
                      axisLine: const AxisLine(width: 0),
                      title: AxisTitle(text:  'Life Aspects',textStyle: StyleForApp.textStyle12NormalGray),
                    ),
                    primaryYAxis: NumericAxis(minimum: 0, maximum: 40, interval: 10,
                      title: AxisTitle(text:  '%',textStyle: StyleForApp.textStyle12NormalGray),
                      //Hide the gridlines of x-axis
                      // majorGridLines: MajorGridLines(width: 0),
                      //Hide the axis line of x-axis
                      // axisLine: AxisLine(width: 0),
                    ),
                    tooltipBehavior: _tooltip,
                    series: <ChartSeries<ChartData, String>>[
                      BarSeries<ChartData, String>(
                          dataSource: data,
                          width: 0.6,
                          borderRadius: const BorderRadius.all(Radius.circular(1)),
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y,
                          name: 'Life Aspects',
                          color: ColorsForApp.greenColor)
                    ])
            ),
          )
        ],
      ),
    );
  }
  Future<void> share() async {
    await FlutterShare.share(
        title: 'Example share',
        text: 'Example share text',
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'Example Chooser Title');
  }
}
class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;

}