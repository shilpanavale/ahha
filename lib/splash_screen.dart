import 'dart:async';

import 'package:demo/Login/login_page.dart';
import 'package:demo/Utils/asset_files.dart';
import 'package:demo/dashboard_page.dart';
import 'package:flutter/material.dart';


class SplashPage extends StatefulWidget {
  static const String id = 'SplashPage';

  const SplashPage({Key? key}) : super(key: key);
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool? loginStatus;

  startTime() async {
    //SharedPreferences preferences = await SharedPreferences.getInstance();
   // setState(() {
    //  loginStatus = preferences.getBool("islogin");
   // });
    var _duration = Duration(seconds: 8);
    return Timer(_duration, navigationPage);
  }

  Future<void> navigationPage() async {
    print("loginStatus-->$loginStatus");

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const LoginPage(),
        ),
            (route) => false,
      );

  }

  @override
  void initState() {
    startTime();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              AssetsFiles.launcher,
            ),
          ),
        ),
      ),
    );
  }
}
