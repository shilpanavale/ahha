import 'package:demo/Dashboard/dominant_past.dart';
import 'package:demo/Dashboard/zoom_drawer.dart';
import 'package:demo/Utils/app_theme.dart';
import 'package:demo/Utils/asset_files.dart';
import 'package:demo/change_page.dart';
import 'package:demo/habit_home.dart';
import 'package:demo/set_habit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class WellbeingIndex extends StatefulWidget {
  final zoomController;
  const WellbeingIndex({Key? key, this.zoomController}) : super(key: key);



  @override
  State<WellbeingIndex> createState() => _WellbeingIndexState();
}

class _WellbeingIndexState extends State<WellbeingIndex>  with TickerProviderStateMixin {

  int tabIndex = 0;
  List<String> title=[
    "Wellness Index",
    "Dominant Emotion",
    "Habits",
    "Progress",
    "Accomplishment"
  ];
  double progressValue = 8.3;


  late TabController _tabController;

  @override
  void initState() {

    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.animateTo(2);
  }
  // selected's value = 0. For default first item is open.
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsForApp.appBackGround,
      appBar: AppBar(
        backgroundColor: ColorsForApp.appBackGround,
        elevation: 0,
          leading: InkWell(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>ZoomDrawerPage())),
            child: Icon(Icons.arrow_back_outlined),
          ),
        title: Text("Wellness Index",style: StyleForApp.textStyle13NormalWhite,)
      ),
      body: SizedBox(
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child:DefaultTabController(
                length: 4,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        constraints:  BoxConstraints.expand(
                          height: 40,
                          width: MediaQuery.of(context).size.width,
                        ),
                        child:  TabBar(
                            isScrollable: true,
                            indicatorColor: Colors.green,
                            labelStyle: StyleForApp.textStyle13NormalWhite,
                            tabs: const [
                              Tab(text: "Current"),
                              Tab(text: "Past"),
                              Tab(text: "Change"),
                              Tab(text: "Grow"),
                            ]),
                      ),
                      SizedBox(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height,
                        child: TabBarView(
                            physics: ScrollPhysics(),
                            viewportFraction: 1.0,
                            children: [
                              Container(
                                child: CurrentScore(),
                              ),
                              Container(
                                child: Past(),
                              ),
                              Container(
                                child: ChangePage(),
                              ),
                              Container(
                                child: Text("Home Body"),
                              ),
                            ]),
                      )

                    ],
                  ),
                ),
              )
          )
      ),

     /* bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey[400],
          backgroundColor: ColorsForApp.appBackGround,
          currentIndex: tabIndex,
          onTap: (int index) {
            setState(() {
              tabIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.bar_chart_sharp),

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: '',
            ),
          ]),*/

    );
  }



}

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
          SizedBox(height: 5,),
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
                        SizedBox(height: 5,),
                        Text('Total Wellbeing index',style: StyleForApp.textStyle13NormalWhite,),
                      ],
                    )
                ),
              ),
              SizedBox(width: 5,),
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
                          SizedBox(height: 5,),
                          Text('Current month',style: StyleForApp.textStyle13NormalWhite,),
                        ],
                      )
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
           // height: 190,
            child: SizedBox(
              height: 200,
              child: SfCartesianChart(
                  title: ChartTitle(text:  'Life Aspect Vs Score',alignment:ChartAlignment.near,textStyle:  StyleForApp.textStyle13NormalWhite),
                  primaryXAxis: CategoryAxis(
                    //Hide the gridlines of y-axis
                      majorGridLines: MajorGridLines(width: 0),
                      //Hide the axis line of y-axis
                      axisLine: AxisLine(width: 0),
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
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
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