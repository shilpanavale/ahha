import 'package:demo/Dashboard/Dominant/dominant_emotion.dart';
import 'package:demo/Dashboard/Habits/habits_menu.dart';
import 'package:demo/Dashboard/WellbeingIndex/wellbeing_index.dart';
import 'package:demo/Dashboard/drawer.dart';

import 'package:demo/Utils/app_theme.dart';
import 'package:demo/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Utils/asset_files.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  DrawerPageState createState() => DrawerPageState();
}

class DrawerPageState extends State<DrawerPage> {
  final _drawerController = ZoomDrawerController();





  @override
  Widget build(BuildContext context) {

  return Drawer(
    backgroundColor: ColorsForApp.appBackGround,
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        /*DrawerHeader(
          child:
          decoration: BoxDecoration(
            color: ColorsForApp.blackLightColor,
          ),
        ),*/
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 80,
                width: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.transparent,
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage(
                      AssetsFiles.ahhaaLogo,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        ListTile(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const WellbeingIndex()));

          },
          leading: Container(
            height: 30,width: 30,
            padding: const EdgeInsets.all(3.0),

            child: const FaIcon(FontAwesomeIcons.heartPulse,size: 18, color: ColorsForApp.white),
          ),
          /*trailing: Container(
            height: 30,width: 30,
            padding: const EdgeInsets.all(3.0),
            child: Icon(Icons.arrow_forward_ios,size: 16, color: ColorsForApp.white),
          ),*/
          title: Text("Wellbeing index",style: StyleForApp.textStyle13NormalWhite),
        ),
        ListTile(
          leading: Container(
            height: 30,width: 30,
            padding: const EdgeInsets.all(3.0),

            child: const FaIcon(FontAwesomeIcons.faceSmile,size: 18, color: ColorsForApp.white),
          ),
          title: Text("Dominant Emotion",style: StyleForApp.textStyle13NormalWhite),
          onTap:() {
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => const DominantEmotion()));
          }
        ),
        ListTile(
          leading: Container(
            height: 30,width: 30,
            padding: const EdgeInsets.all(3.0),

            child: const FaIcon(FontAwesomeIcons.chartSimple, size: 18,color: ColorsForApp.white),
          ),
          title: Text("Habits",style: StyleForApp.textStyle13NormalWhite),
          onTap: (){

            Navigator.push(context, MaterialPageRoute(builder: (context)=>const HabitMenu()));

          },
        ),
        ListTile(
          leading: Container(
            height: 30,width: 30,
            padding: const EdgeInsets.all(3.0),

            child: const FaIcon(FontAwesomeIcons.hourglass, size: 18,color: ColorsForApp.white),
          ),
          title: Text("Progress",style: StyleForApp.textStyle13NormalWhite),
        ),
        ListTile(
          leading: Container(
            height: 30,width: 30,
            padding: const EdgeInsets.all(3.0),

            child: const FaIcon(FontAwesomeIcons.trophy,size: 18, color: ColorsForApp.white),
          ),
          title: Text("Accomplishment",style: StyleForApp.textStyle13NormalWhite),
        )
      ],
    ),
  );


  }
}