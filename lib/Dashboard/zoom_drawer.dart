import 'package:demo/Dashboard/drawer.dart';
import 'package:demo/Dashboard/wellbeing_index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../dashboard_page1.dart';

class ZoomDrawerPage extends StatefulWidget {
  @override
  _ZoomDrawerPageState createState() => _ZoomDrawerPageState();
}

class _ZoomDrawerPageState extends State<ZoomDrawerPage> {
  final _drawerController = ZoomDrawerController();





  @override
  Widget build(BuildContext context) {




    return ZoomDrawer(
      controller: _drawerController,
      style: DrawerStyle.defaultStyle,
      menuScreen:const DrawerMenuScreen(),
      mainScreen: WellbeingIndex(),
      borderRadius: 24.0,
      showShadow: true,
      //angle: -12.0,
      angle: 0.0,
      // menuBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
      menuBackgroundColor: Colors.grey.shade300,
      mainScreenTapClose: true,
      drawerShadowsBackgroundColor: Colors.white,
      mainScreenAbsorbPointer: true,
      // mainScreenOverlayColor: Colors.blue.shade50,
      // slideWidth: MediaQuery.of(context).size.width * 0.70,
      menuScreenWidth: double.infinity,
      //  menuScreenHeight: double.infinity,

      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.bounceIn,

    );

  }
}