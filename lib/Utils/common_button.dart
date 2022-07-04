
import 'package:demo/Utils/app_theme.dart';
import 'package:flutter/material.dart';

class CommonButtonForAllApp extends StatelessWidget {
  const CommonButtonForAllApp({Key? key, required this.onPressed,required this.title,}) : super(key: key);
  final GestureTapCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 15.0,right: 15.0,bottom: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,height: 45,
              decoration: BoxDecoration(
                 color: ColorsForApp.blackVeryLightColor,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: ColorsForApp.blackVeryLightColor.withOpacity(
                            0.6),
                        offset: const Offset(1.1, 1.1),
                        blurRadius: 10.0),
                  ],
                  gradient: LinearGradient(colors: [
                    ColorsForApp.blackVeryLightColor,
                    ColorsForApp.blackVeryLightColor,
                  ]),
                  borderRadius: BorderRadius.circular(10.0)
              ),
              child: TextButton(
                onPressed: onPressed,
                child:  Text(
                  title,
                  style: const TextStyle(fontSize:16,color: Colors.white),
                ),
              ),
            ),
          ],
        )
    );
  }

}


