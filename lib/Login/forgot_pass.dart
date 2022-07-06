import 'package:demo/Login/reset_pass.dart';
import 'package:demo/Login/reset_pass_success.dart';
import 'package:demo/Utils/app_theme.dart';
import 'package:demo/Utils/asset_files.dart';
import 'package:demo/Utils/common_button.dart';
import 'package:demo/Utils/text_fields.dart';
import 'package:flutter/material.dart';


class ForgotPassPage extends StatefulWidget {

  const ForgotPassPage({Key? key}) : super(key: key);
  @override
  ForgotPassPageState createState() => ForgotPassPageState();
}

class ForgotPassPageState extends State<ForgotPassPage> {
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
                 height: 100,
                 width: double.infinity,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(15.0),
                   color: Colors.transparent,

                 ),
               ),
             ),
             SizedBox(height: 10,),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text('Forgot Password',style: StyleForApp.headline,),
               ],
             ),
             SizedBox(height: 15,),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text('Enter the email associated with your account\n and we will send an email with instructions to\n'
                     'reset your password',style: StyleForApp.textStyle13NormalWhite,),
               ],
             ),
             SizedBox(height: 20,),
             CommonTextField.normalTextField(Icons.email, "Email address", newPassController, TextInputType.text),

             SizedBox(height: 30,),
             CommonButtonForAllApp(title: 'Reset',onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>ResetPassPage()));
             },),
             const SizedBox(height: 10),


           ],
         ),
       ),
     ),
   );
  }

}