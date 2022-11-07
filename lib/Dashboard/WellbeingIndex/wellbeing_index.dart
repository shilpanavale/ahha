import 'package:demo/Dashboard/Dominant/dominant_past.dart';
import 'package:demo/Dashboard/WellbeingIndex/wellbeing_change.dart';
import 'package:demo/Dashboard/drawer.dart';
import 'package:demo/Utils/app_theme.dart';
import 'package:demo/Utils/asset_files.dart';
import 'package:demo/Dashboard/WellbeingIndex/wellbeing_previous.dart';
import 'package:demo/Dashboard/Habits/habit_home.dart';
import 'package:demo/Dashboard/Habits/set_habit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Dominant/dominant_emotion.dart';


class WellbeingIndex extends StatefulWidget {

  const WellbeingIndex({Key? key}) : super(key: key);



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
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: ColorsForApp.appBackGround,
        appBar: AppBar(
          backgroundColor: ColorsForApp.appBackGround,
          elevation: 0,
            titleSpacing: 0.0,
            bottom:  TabBar(
              isScrollable: true,
              indicatorColor: Colors.green,
              labelStyle: StyleForApp.textStyle13NormalWhite,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: const EdgeInsets.all(5),
              physics: const BouncingScrollPhysics(),
             // controller: _tabController,
              tabs: const [
                // Add Tabs here
                SizedBox(
                  width: 60, child:  Tab(icon:FaIcon(FontAwesomeIcons.bolt,size: 18, color: ColorsForApp.white),text: "Current")),
                SizedBox(width: 60,child:  Tab(icon:FaIcon(FontAwesomeIcons.solidCalendar,size: 18, color: ColorsForApp.white),text: "Previous")),
                SizedBox(width: 60,child:  Tab(icon:FaIcon(FontAwesomeIcons.chartLine,size: 18, color: ColorsForApp.white),text: "Change")),
                SizedBox(width: 60,child:  Tab(icon:FaIcon(FontAwesomeIcons.seedling,size: 18, color: ColorsForApp.white),text: "Grow")),
              ],
            ),
          title: Text("Wellness Index",style: StyleForApp.textStyle14NormalWhite,)
        ),
        body:  const Padding(
          padding: EdgeInsets.all(8.0),
          child: TabBarView(
              physics: ScrollPhysics(),
              viewportFraction: 1.0,
              children: [
                CurrentScore(),
                WellBeingPrevious(),
                ChangePage(),
                Text("Home Body"),
              ]),
        ),
      ),
    );
  }



}

