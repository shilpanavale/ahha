import 'package:demo/Dashboard/dominant_past.dart';
import 'package:demo/Utils/app_theme.dart';
import 'package:demo/Utils/asset_files.dart';
import 'package:demo/change_page.dart';
import 'package:demo/habit_home.dart';
import 'package:demo/set_habit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'Dashboard/dominant_current.dart';

class DB1 extends StatefulWidget {
  const DB1({Key? key}) : super(key: key);


  @override
  State<DB1> createState() => _DB1State();
}

class _DB1State extends State<DB1>  with TickerProviderStateMixin {

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
        title: Container(
          height: 80,
          width: 110,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.transparent,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                AssetsFiles.ahhaaLogo,
              ),
            ),
          ),
        ),
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
              child:
              ListView.builder(
                  key: Key('builder ${selected.toString()}'),
                physics: const NeverScrollableScrollPhysics(),
                  itemCount: title.length,
                  itemBuilder: (_, index) {
                    final item = title[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          // border: Border.all(),
                            color: ColorsForApp.blackLightColor,
                            borderRadius: BorderRadius.circular(15.0)
                        ),
                        child: ExpansionTile(
                          key: Key(index.toString()), //attention
                          initiallyExpanded: index == selected,
                          onExpansionChanged: ((newState) {
                            if (newState) {
                              setState(() {
                                const Duration(seconds: 20000);
                                selected = index;
                              });
                            } else {
                              setState(() {
                                selected = -1;
                              });
                            }
                          }),
                          trailing: const Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,size: 20,),
                          leading: Container(
                            height: 30,width: 30,
                            padding: const EdgeInsets.all(3.0),
                            decoration: const BoxDecoration(
                                borderRadius:  BorderRadius.all(Radius.circular(8.0)),
                                color: ColorsForApp.nearlyWhite
                            ),
                            child: Icon(Icons.bar_chart_sharp, color: ColorsForApp.greenColor),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          childrenPadding:
                          const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          expandedCrossAxisAlignment: CrossAxisAlignment.end,
                          maintainState: true,
                          collapsedBackgroundColor: ColorsForApp.blackVeryLightColor,
                          title: Text(item,style: StyleForApp.textStyle13NormalWhite),
                          // contents
                          children: [
                            item=="Wellness Index"? SizedBox(
                              height: 350,
                              child: DefaultTabController(
                                length: 4,
                                child: Column(
                                  children: [
                                    Container(
                                      constraints:  BoxConstraints.expand(
                                        height: 40, width: MediaQuery.of(context).size.width,
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
                                      height: 300,
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
                              )
                            )
                            :item=="Dominant Emotion"?SizedBox(
                                height: 350,
                                child: DefaultTabController(
                                  length: 4,
                                  child: Column(
                                    children: [
                                      Container(
                                        constraints:  BoxConstraints.expand(
                                          height: 40, width: MediaQuery.of(context).size.width,
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
                                      Expanded(
                                       // height: 300,
                                        child: TabBarView(
                                           // physics: const ScrollPhysics(),
                                            viewportFraction: 1.0,
                                            children: [
                                              Container(
                                                child: DominantCurrent(),
                                              ),
                                              Container(
                                                child: DominantPast(),
                                              ),
                                              Container(
                                                child: Text("Home Body"),
                                              ),
                                              Container(
                                                child: Text("Home Body"),
                                              ),
                                            ]),
                                      )

                                    ],
                                  ),
                                )
                            )
                                :item=="Habits"? SizedBox(
                                height: MediaQuery.of(context).size.height,
                                child: DefaultTabController(
                                  length: 3,
                                  child: ListView(
                                    //key: '',
                                    physics: NeverScrollableScrollPhysics(),
                                    key: PageStorageKey<String>('1'),
                                    children: [
                                      Container(
                                        constraints:  BoxConstraints.expand(
                                          height: 40, width: MediaQuery.of(context).size.width,
                                        ),
                                        child:  TabBar(
                                            isScrollable: true,
                                            indicatorColor: Colors.green,
                                            labelStyle: StyleForApp.textStyle13NormalWhite,
                                            tabs: const [
                                              Tab(text: "Home"),
                                              Tab(text: "My Habit"),
                                              Tab(text: "Set Habit"),
                                            ]),
                                      ),
                                      SizedBox(
                                        height: MediaQuery.of(context).size.height,
                                        child: TabBarView(
                                            physics: ScrollPhysics(),
                                            viewportFraction: 1.0,
                                            children: [
                                              Container(
                                                child: HabitHome(),
                                              ),
                                              Container(
                                                child: Text("Articles Body"),
                                              ),
                                              Container(
                                                  child: SetHabits()
                                              ),

                                            ]),
                                      )

                                    ],
                                  ),
                                )
                            )
                            :const Text("")



                          ],
                        ),
                      ),
                    );
                  }))
      ),

      bottomNavigationBar: BottomNavigationBar(
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
          ]),

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