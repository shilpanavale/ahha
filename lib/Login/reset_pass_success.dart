import 'package:demo/Login/login_page.dart';
import 'package:demo/Utils/app_theme.dart';
import 'package:demo/Utils/asset_files.dart';
import 'package:demo/Utils/common_button.dart';
import 'package:demo/Utils/text_fields.dart';
import 'package:flutter/material.dart';


class ResetPassSuccess extends StatefulWidget {

  const ResetPassSuccess({Key? key}) : super(key: key);
  @override
  ResetPassSuccessState createState() => ResetPassSuccessState();
}

class ResetPassSuccessState extends State<ResetPassSuccess> {
  TextEditingController newPassController=TextEditingController();
  TextEditingController confirmPassController=TextEditingController();

  bool value=false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     backgroundColor: ColorsForApp.appBackGround,
     body: SafeArea(
       child: SingleChildScrollView(
         child: Column( 
           children: [
             const SizedBox(height: 20),
             Container(
               height: 90,
               width: 140,
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
             Padding(
               padding: const EdgeInsets.all(15.0),
               child: Container(
                 height: 170,
                 width: 250,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(15.0),
                   color: Colors.transparent,
                   image: DecorationImage(
                     fit: BoxFit.fill,
                     image: AssetImage(
                       AssetsFiles.check_box,
                     ),
                   ),
                 ),
                // child: Icon(Icons.check_box,color: ColorsForApp.greenColor,size: 100,),
               ),
             ),
            // const SizedBox(height: 20,),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text('Your password has been successfully reset.',style: StyleForApp.textStyle14NormalWhite,),
               ],
             ),
             SizedBox(height: 15,),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text('Click below to login.',style: StyleForApp.textStyle13NormalWhite,),
               ],
             ),
             SizedBox(height: 20,),

             SizedBox(height: 30,),
             CommonButtonForAllApp(title: 'Login',onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
             },),
             const SizedBox(height: 10),


           ],
         ),
       ),
     ),
   );
  }

}