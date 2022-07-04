import 'package:demo/Utils/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int tabIndex = 0;
  List<String> title=[
    "Wellness Index",
    "Dominant Emotion",
    "My goals",
    "My progress"
  ];
  double progressValue = 8.3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:ColorsForApp.appBackGround ,
      appBar: AppBar(
        backgroundColor: ColorsForApp.appBackGround,
        elevation: 0,
        title:  Text('Ahhaa',style: TextStyle(color: ColorsForApp.greenColor),),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: SizedBox(
             height: 40,
             child: ListView.builder(
                 scrollDirection: Axis.horizontal,
               itemCount: title.length,
               itemBuilder: (context, index) {
                 return Padding(
                   padding: const EdgeInsets.all(3.0),
                   child: Container(
                     width: 110,
                     decoration: BoxDecoration(
                       // border: Border.all(),
                         color: ColorsForApp.blackLightColor,
                         borderRadius: BorderRadius.circular(10.0)
                     ),
                     child: Center(child: Text(title[index],style: StyleForApp.textStyle13NormalWhite,),),
                   ),
                 );
               }),

           ),
           ),
          Expanded(
            child: DefaultTabController(
              length: 4,
              child: Column(
                children: <Widget>[
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
                  Expanded(
                    child: TabBarView(children: [
                      Container(
                        child: Text("Home Body"),
                      ),
                      Container(
                        child: Text("Articles Body"),
                      ),
                      Container(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    // border: Border.all(),
                                      color: ColorsForApp.blackLightColor,
                                      borderRadius: BorderRadius.circular(10.0)
                                  ),
                                  height: 150,
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    width: 135,
                                                   // height: 80,
                                                    decoration: BoxDecoration(
                                                      // border: Border.all(),
                                                        color: ColorsForApp.blackVeryLightColor,
                                                        borderRadius: BorderRadius.circular(10.0)
                                                    ),
                                                    child:Padding(
                                                      padding: const EdgeInsets.only(left: 8.0,top: 4.0),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Text('Monthly',style: StyleForApp.textStyle13NormalWhite,),
                                                             // Icon(Icons)
                                                            ],
                                                          ),
                                                          SizedBox(height: 5,),
                                                          Text('Aprill 2022',style: StyleForApp.textStyle14NormalWhite,),
                                                        ],
                                                      ),
                                                    )



                                                    /*ExpansionTile(
                                                      iconColor: Colors.green,
                                                      collapsedIconColor:ColorsForApp.greenColor ,
                                                      title: ,
                                                      children: [
                                                        Text('Aprill 2022',style: StyleForApp.textStyle13NormalWhite,),
                                                      ],
                                                    ) ,*/
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    width: 130,
                                                   // height: 50,
                                                    decoration: BoxDecoration(
                                                      // border: Border.all(),
                                                        color: ColorsForApp.blackVeryLightColor,
                                                        borderRadius: BorderRadius.circular(10.0)
                                                    ),
                                                    child:Padding(
                                                      padding: const EdgeInsets.only(left: 8.0,top: 4.0),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text('Emotion',style: StyleForApp.textStyle13NormalWhite,),
                                                          SizedBox(height: 5,),
                                                          Text('Happy',style: StyleForApp.textStyle14NormalWhite,),
                                                        ],
                                                      ),
                                                    )
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                     Container(
                                       height: 120,
                                       width: 130,
                                       child:  SfRadialGauge(
                                           axes: <RadialAxis>[
                                             RadialAxis(
                                               minimum: 0,
                                               maximum: 200,
                                       annotations: <GaugeAnnotation>[
                                           GaugeAnnotation(
                                           positionFactor: 0.1,
                                           angle: 0,
                                           widget: Text(
                                             progressValue.toString() + '\nTotal Wellness\n Index',
                                             style: TextStyle(fontSize: 10,color: Colors.white),
                                           )
                                           )
                                         ],
                                               showLabels: false,
                                               showTicks: false,
                                               //startAngle: 90,
                                               //endAngle: 0,
                                               radiusFactor: 0.9,
                                               canScaleToFit: true,
                                               axisLineStyle: AxisLineStyle(
                                                 thickness: 0.2,
                                                 color: ColorsForApp.greenColor,
                                                 thicknessUnit: GaugeSizeUnit.factor,
                                                 cornerStyle: CornerStyle.startCurve,
                                               ),
                                               pointers: <GaugePointer>[
                                                 RangePointer(
                                                     animationDuration: 100,
                                                     enableAnimation: true,
                                                     value: progressValue,
                                           gradient:  SweepGradient(colors: <Color>[
                                             ColorsForApp.greenColor,
                                             Colors.green.shade100
                                           ], stops: const <double>[
                                             0.26,
                                             0.75
                                           ]),
                                                     width: 0.1,
                                                     sizeUnit: GaugeSizeUnit.factor,
                                                     animationType: AnimationType.bounceOut,
                                                     cornerStyle: CornerStyle.bothCurve),

                                               ],
                                             )
                                           ]),
                                     )
                                      
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    // border: Border.all(),
                                      color: ColorsForApp.blackLightColor,
                                      borderRadius: BorderRadius.circular(10.0)
                                  ),
                                  height: 180,
                                  width: MediaQuery.of(context).size.width,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        // border: Border.all(),
                                          color: ColorsForApp.blackVeryLightColor,
                                          borderRadius: BorderRadius.circular(10.0)
                                      ),
                                      child: ExpansionTile(
                                        initiallyExpanded: true,
                                        collapsedIconColor: Colors.white,
                                        title: Text("Dominant Emotion",style: StyleForApp.textStyle13NormalWhite),
                                        subtitle:Text("Monthly",style: StyleForApp.textStyle13NormalWhite) ,

                                        children: [
                                          Container(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Column(
                                                  children: [
                                                    Container(
                                                      child: Icon(Icons.donut_small_sharp,color: Colors.white,),
                                                    ),
                                                    SizedBox(height: 10,),
                                                    Text("Happy",style: StyleForApp.textStyle14NormalWhite)
                                                  ],
                                                )

                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    // border: Border.all(),
                                      color: ColorsForApp.blackLightColor,
                                      borderRadius: BorderRadius.circular(10.0)
                                  ),
                                  height: 180,
                                  width: MediaQuery.of(context).size.width,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
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
                                          children: [
                                            Text("Change",style: StyleForApp.textStyle13NormalWhite),
                                            SizedBox(height: 5,),
                                            Text("Monthly",style: StyleForApp.textStyle13NormalWhite),


                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ),Container(
                        child: Text("User Body"),
                      ),
                    ]),
                  )
                ],
              ),
            ),
          ),

        ],
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