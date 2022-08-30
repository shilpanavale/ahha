import 'dart:convert';
import 'dart:io';

import 'package:demo/Utils/app_theme.dart';
import 'package:demo/Utils/asset_files.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DrawerMenuScreen extends StatefulWidget {
  const DrawerMenuScreen({Key? key}) : super(key: key);

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
                    title: Text("Wellbeing index"),
                  )

                ])
        ),
      ),
    );
  }



}