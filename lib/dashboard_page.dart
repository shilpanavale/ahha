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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                      color: ColorsForApp.blackVeryLightColor, borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: IconButton(
                            icon:  Icon(Icons.mic,color: ColorsForApp.greenColor,),
                            onPressed: () {
                              /* Clear the search field */
                            },
                          ),
                          hintText: 'Type how you feel',
                          contentPadding: EdgeInsets.all(17),
                          hintStyle: StyleForApp.textStyle13NormalWhite,
                          border: InputBorder.none),
                    ),
                  ),
                ),
              ),
              Builder(
                  builder: (context) {
                    return Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          onPressed: (){
                            if(_tabController.index > 0){
                              _tabController.animateTo(_tabController.index - 1);
                            }else{
                              Scaffold.of(context).showSnackBar(SnackBar(content: Text("Can't go back"),));
                            }
                          },
                        ),
                        Expanded(
                          child: TabBar(
                            isScrollable: true,
                            controller: _tabController,
                            labelStyle: TextStyle(
                                color: Colors.black
                            ),
                            unselectedLabelColor: Colors.black,
                            labelColor: Colors.blue,
                            tabs: List.generate(
                              20,
                                  (index) {
                                return Tab(
                                  text: "Tab $index",
                                );
                              },
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_forward_ios),
                          onPressed: (){
                            if(_tabController.index+1 < 20){
                              _tabController.animateTo(_tabController.index + 1);
                            }else{
                              Scaffold.of(context).showSnackBar(SnackBar(content: Text("Can't move forward"),));
                            }
                          },
                        ),
                      ],
                    );
                  }
              )


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