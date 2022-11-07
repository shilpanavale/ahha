import 'package:demo/Utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HabitHome extends StatefulWidget{
  final zoomController;

  const HabitHome({Key? key,this.zoomController}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return HabitHomeState();
  }


}
class HabitHomeState extends State<HabitHome>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('August 2022',style: StyleForApp.textStyle14BoldGreen,),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
           children: [
             Padding(
               padding: const EdgeInsets.only(right: 8.0),
               child: Text('View all',style: StyleForApp.textStyle13NormalWhite,),
             ),
           ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  // border: Border.all(),
                    color: ColorsForApp.blackVeryLightColor,
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Build My Relationships',style: StyleForApp.textStyle13NormalWhite,),
                          // Icon(Icons)
                        ],
                      ), Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('378/0 Completed',style: StyleForApp.textStyle13Gray,),
                          // Icon(Icons)
                        ],
                      ),

                     Container(height: 15,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(15.0),
                         color: Colors.black,
                       ),

                     )
                    ],
                  ),
                )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  // border: Border.all(),
                    color: ColorsForApp.blackVeryLightColor,
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Mindset of an Entrepreneur',style: StyleForApp.textStyle13NormalWhite,),
                          // Icon(Icons)
                        ],
                      ), Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('378/0 Completed',style: StyleForApp.textStyle13Gray,),
                          // Icon(Icons)
                        ],
                      ),

                      Container(height: 15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.black,
                        ),

                      )
                    ],
                  ),
                )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  // border: Border.all(),
                    color: ColorsForApp.blackVeryLightColor,
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Manage My Anger',style: StyleForApp.textStyle13NormalWhite,),
                          // Icon(Icons)
                        ],
                      ), Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('315/24 Completed',style: StyleForApp.textStyle13Gray,),
                          // Icon(Icons)
                        ],
                      ),
                      Container(
                       // margin: EdgeInsets.symmetric(vertical: 20),
                        width: double.infinity,
                        height: 15,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: LinearProgressIndicator(
                            value: 0.4,
                            valueColor: AlwaysStoppedAnimation<Color>(Color(0xff00ff00)),
                            backgroundColor: Colors.black,
                          ),
                        ),
                      )
                      /*Container(height: 15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.black,
                        ),

                      )*/
                    ],
                  ),
                )
            ),
          ),
        ],
      ),
    );
  }

}