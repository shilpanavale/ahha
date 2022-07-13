import 'package:demo/Utils/app_theme.dart';
import 'package:demo/Utils/asset_files.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>  with TickerProviderStateMixin {

  int tabIndex = 0;
  List<String> title=[
    "Wellness Index",
    "Dominant Emotion",
    "My goals",
    "My progress"
  ];
  double progressValue = 8.3;
  final List<Map<String, dynamic>> _items =
  [
    {

    "id": 1,
    "title": "Wellness Index",

  },
    {
      "id": 2,
      "title": "Dominant Emotion",

    },
    {
      "id": 3,
      "title": "My goals",

    },
    {
      "id": 4,
      "title": "My progress",

    }
            ];

  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.animateTo(2);
  }

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
                physics: NeverScrollableScrollPhysics(),
                  itemCount: title.length,
                  itemBuilder: (_, index) {
                    final item = title[index];
                    return Container(
                      decoration: BoxDecoration(
                        // border: Border.all(),
                          color: ColorsForApp.blackLightColor,
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: Card(
                        // this key is required to save and restore ExpansionTile expanded state
                        //key: PageStorageKey(item['id']),
                        key: PageStorageKey<String>(title.elementAt(index)),
                        color: ColorsForApp.blackLightColor,
                        elevation: 4,
                        child: ExpansionTile(
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
                                            Tab(text: "Current Score"),
                                            Tab(text: "Previous Score"),
                                            Tab(text: "Change"),
                                            Tab(text: "Recommendations"),
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
                                              child: Text("Articles Body"),
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
                            ):const Text("")



                          ],
                        ),
                      ),
                    );
                  }))
      ),


      /*ListView.builder(
           // shrinkWrap: true,
             // scrollDirection: Axis.horizontal,
            itemCount: title.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    // border: Border.all(),
                      color: ColorsForApp.blackLightColor,
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  child:ExpansionTile(
                  iconColor: Colors.white,
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                  collapsedIconColor:ColorsForApp.greenColor ,
                    leading: Container(
                      height: 30,width: 30,
                      padding: EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                          borderRadius:  BorderRadius.all(Radius.circular(8.0)),
                        color: ColorsForApp.nearlyWhite
                      ),
                      child: Icon(Icons.bar_chart_sharp, color: ColorsForApp.greenColor),
                    ),
                  title:Text(title[index],style: StyleForApp.textStyle13NormalWhite,) ,
                    childrenPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    expandedCrossAxisAlignment: CrossAxisAlignment.end,
                    controlAffinity: ListTileControlAffinity.leading,
                    maintainState: true,
                  children: [
                    Column(
                      children: const [
                        ListTile(title: Text("shilpa"),)
                      ],
                    ),
                  ],
                ) ,

                  */ /*Center(
                    child: Text(title[index],style: StyleForApp.textStyle13NormalWhite,),),
                ),*/ /*
              )
              );
            }),*/


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
  @override
  void initState(){
    _tooltipBehavior =  TooltipBehavior(enable: true);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('9.3',style: StyleForApp.textStyle14BoldGreen,),
                            // Icon(Icons)
                          ],
                        ),
                        SizedBox(height: 5,),
                        Text('Total Wellbeing index',style: StyleForApp.textStyle13NormalWhite,),
                      ],
                    )
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('May 2022',style: StyleForApp.textStyle14BoldGreen,),
                            // Icon(Icons)
                          ],
                        ),
                        SizedBox(height: 5,),
                        Text('Current month',style: StyleForApp.textStyle13NormalWhite,),
                      ],
                    )
                ),
              ),
            ),
          ],
        ),
        Container(

          decoration: BoxDecoration(
            // border: Border.all(),
              color: ColorsForApp.blackVeryLightColor,
              borderRadius: BorderRadius.circular(10.0)
          ),
          height: 180,
          child: Column(
            children: [
              Container(
                height: 150,
                child: SfCartesianChart(
                    title: ChartTitle(text: 'Wellness index',alignment:ChartAlignment.near,textStyle: StyleForApp.textStyle13NormalWhite),
                    primaryXAxis: CategoryAxis(
                      //Hide the gridlines of y-axis
                        majorGridLines: MajorGridLines(width: 0),
                        //Hide the axis line of y-axis
                        axisLine: AxisLine(width: 0)
                    ),
                    enableAxisAnimation: true,

                    // Enable tooltip
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <ChartSeries>[

                      LineSeries<ChartData, String>(
                          enableTooltip: true,

                          dataSource: [
                            ChartData('Jan', 10 ),
                            ChartData('Feb', 28),
                            ChartData('Mar', 34),
                            ChartData('Apr', 32),
                            ChartData('May', 40),

                          ],
                          // Bind the color for all the data points from the data source
                          pointColorMapper:(ChartData data, _) => ColorsForApp.greenColor,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y
                      )
                    ]
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.thumb_up_alt_outlined,color: ColorsForApp.nearlyWhite,size: 20,),
                 // SizedBox(width: 10,),
                  Icon(Icons.share,color: ColorsForApp.nearlyWhite,size: 20,)
                ],
              )
            ],
          ),
        )
      ],
    );
  }

}
class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;

}