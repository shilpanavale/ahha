import 'package:demo/Utils/app_theme.dart';
import 'package:demo/Utils/asset_files.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SetHabits extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return SetHabitsState();
  }


}
class SetHabitsState extends State<SetHabits>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
           children: [
             Padding(
               padding: const EdgeInsets.only(right: 8.0),
               child: Text('View all',style: StyleForApp.textStyle13NormalWhite,),
             ),
           ],
          ),
          const SizedBox(height: 5,),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                      width: 150,
                      height: 170,
                      decoration: BoxDecoration(
                        // border: Border.all(),
                          color: ColorsForApp.blackVeryLightColor,
                          borderRadius: BorderRadius.circular(8.0)
                      ),
                      child:Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 8.0,bottom: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 110,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image: AssetImage(
                                        AssetsFiles.setGoal1,
                                      ),
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                               //height: 80,
                            ),

                            SizedBox(
                              height: 31,width: 70,
                              child: ElevatedButton(onPressed: (){},
                                style: ElevatedButton.styleFrom(
                                  primary: ColorsForApp.greenColor,
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                ),
                                child: const Text('Set Habit',style: TextStyle(fontSize: 12),),
                              ),
                            )


                          ],
                        ),
                      )
                  ),
                ),
              ),
              const SizedBox(width: 5,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                      width: 150,
                      height: 170,
                      decoration: BoxDecoration(
                        // border: Border.all(),
                          color: ColorsForApp.blackVeryLightColor,
                          borderRadius: BorderRadius.circular(8.0)
                      ),
                      child:Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 8.0,bottom: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 110,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image: AssetImage(
                                      AssetsFiles.setGoal1,
                                    ),
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              //height: 80,
                            ),

                            SizedBox(
                              height: 31,width: 70,
                              child: ElevatedButton(onPressed: (){},
                                style: ElevatedButton.styleFrom(
                                  primary: ColorsForApp.greenColor,
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                ),
                                child: const Text('Set Habit',style: TextStyle(fontSize: 12),),
                              ),
                            )


                          ],
                        ),
                      )
                  ),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }

}