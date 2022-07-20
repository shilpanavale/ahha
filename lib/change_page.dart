
import 'package:demo/Utils/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ChangePage extends StatefulWidget {
  const ChangePage({Key? key}) : super(key: key);


  @override
  State<ChangePage> createState() => _ChangePageState();
}

class _ChangePageState extends State<ChangePage> {

  double progressValue = 8.3;
  @override
  Widget build(BuildContext context) {

  return Column(
    children: [
      const SizedBox(height: 10,),
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
                                    Text('Aprill 2022',style: StyleForApp.textStyle13NormalWhite,),
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
                                    Text('Happy',style: StyleForApp.textStyle13NormalWhite,),
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
                key: const PageStorageKey<String>("0"),
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
                            Text("Happy",style: StyleForApp.textStyle13NormalWhite)
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
  );
  }
}