
import 'package:demo/Utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar({Key? key, required this.onPressed, required this.title}) : preferredSize = const Size.fromHeight(kToolbarHeight), super(key: key);
  @override
  final Size preferredSize;
  final GestureTapCallback onPressed;
  final String title;// default is 56.0
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}
class _CustomAppBarState extends State<CustomAppBar>{
  @override
  Widget build(BuildContext context) {
    return AppBar(
     elevation: 0,
      backgroundColor: ColorsForApp.appBackGround,
      title: Text(widget.title),
      automaticallyImplyLeading: true,
      /*leading: IconButton(
        icon: Icon(Icons.arrow_back,color: ColorsForApp.nearlyWhite,),
        onPressed: widget.onPressed,
      ),*/
    );
  }
}




