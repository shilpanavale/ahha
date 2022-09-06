import 'dart:convert';
import 'dart:io';

import 'package:demo/Dashboard/dominant_emotion.dart';
import 'package:demo/Dashboard/wellbeing_index.dart';
import 'package:demo/Utils/app_theme.dart';
import 'package:demo/Utils/asset_files.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DrawerMenuScreen extends StatefulWidget {
  final zoomController;
  const DrawerMenuScreen({Key? key, this.zoomController}) : super(key: key);

  @override
  DrawerMenuScreenState createState() => DrawerMenuScreenState();
}

class DrawerMenuScreenState extends State<DrawerMenuScreen> {
  @override
  Widget build(BuildContext context) {
    const _androidStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
    const _iosStyle = TextStyle(color: Colors.white);
    final style = kIsWeb
        ? _androidStyle
        : Platform.isAndroid
        ? _androidStyle
        : _iosStyle;

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
       color: ColorsForApp.blackLightColor,
        child: SafeArea(
            child:Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
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
                  ListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>WellbeingIndex(zoomController: widget.zoomController,)));

                    },
                    leading: Container(
                      height: 30,width: 30,
                      padding: const EdgeInsets.all(3.0),
                      decoration:  BoxDecoration(
                          borderRadius:  BorderRadius.all(Radius.circular(8.0)),
                          color: ColorsForApp.blackLightColor
                      ),
                      child: Icon(Icons.bar_chart_sharp, color: ColorsForApp.greenColor),
                    ),
                    title: Text("Wellbeing index",style: StyleForApp.textStyle13NormalWhite),
                  ),
                  ListTile(
                    leading: Container(
                      height: 30,width: 30,
                      padding: const EdgeInsets.all(3.0),
                      decoration:  BoxDecoration(
                          borderRadius:  BorderRadius.all(Radius.circular(8.0)),
                          color: ColorsForApp.blackLightColor
                      ),
                      child: Icon(Icons.bar_chart_sharp, color: ColorsForApp.greenColor),
                    ),
                    title: Text("Dominant Emotion",style: StyleForApp.textStyle13NormalWhite),
                    onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>DominantEmotion(zoomController: widget.zoomController)));
                    },
                  ),
                  ListTile(
                    leading: Container(
                      height: 30,width: 30,
                      padding: const EdgeInsets.all(3.0),
                      decoration:  BoxDecoration(
                          borderRadius:  BorderRadius.all(Radius.circular(8.0)),
                          color: ColorsForApp.blackLightColor
                      ),
                      child: Icon(Icons.bar_chart_sharp, color: ColorsForApp.greenColor),
                    ),
                    title: Text("Habits",style: StyleForApp.textStyle13NormalWhite),
                  ),
                  ListTile(
                    leading: Container(
                      height: 30,width: 30,
                      padding: const EdgeInsets.all(3.0),
                      decoration:  BoxDecoration(
                          borderRadius:  BorderRadius.all(Radius.circular(8.0)),
                          color: ColorsForApp.blackLightColor
                      ),
                      child: Icon(Icons.bar_chart_sharp, color: ColorsForApp.greenColor),
                    ),
                    title: Text("Progress",style: StyleForApp.textStyle13NormalWhite),
                  ),
                  ListTile(
                    leading: Container(
                      height: 30,width: 30,
                      padding: const EdgeInsets.all(3.0),
                      decoration:  BoxDecoration(
                          borderRadius:  BorderRadius.all(Radius.circular(8.0)),
                          color: ColorsForApp.blackLightColor
                      ),
                      child: Icon(Icons.bar_chart_sharp, color: ColorsForApp.greenColor),
                    ),
                    title: Text("Accomplishment",style: StyleForApp.textStyle13NormalWhite),
                  )

                ])
        ),
      ),
    );
  }



}