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
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text('Ahhaa',style: TextStyle(fontSize:24,color: ColorsForApp.greenColor,fontWeight: FontWeight.bold),),
               ],
             ),
             SizedBox(height: 40,),
             Padding(
               padding: const EdgeInsets.all(15.0),
               child: Container(
                 height: 100,
                 width: double.infinity,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(15.0),
                   color: Colors.transparent,
                 ),
                 child: Icon(Icons.check_box,color: ColorsForApp.greenColor,size: 100,),
               ),
             ),
             SizedBox(height: 20,),
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