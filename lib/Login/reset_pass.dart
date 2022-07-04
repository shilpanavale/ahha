import 'package:demo/Login/reset_pass_success.dart';
import 'package:demo/Utils/app_theme.dart';
import 'package:demo/Utils/asset_files.dart';
import 'package:demo/Utils/common_button.dart';
import 'package:demo/Utils/text_fields.dart';
import 'package:flutter/material.dart';


class ResetPassPage extends StatefulWidget {

  const ResetPassPage({Key? key}) : super(key: key);
  @override
  ResetPassPageState createState() => ResetPassPageState();
}

class ResetPassPageState extends State<ResetPassPage> {
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
             SizedBox(height: 20,),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text('Reset Password',style: StyleForApp.headline,),
               ],
             ),
             SizedBox(height: 15,),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text('Enter your new password',style: StyleForApp.textStyle13NormalWhite,),
               ],
             ),
             SizedBox(height: 20,),
             CommonTextField.passwordTextField(Icons.remove_red_eye, "Enter new password", newPassController, TextInputType.text),
             CommonTextField.passwordTextField(Icons.remove_red_eye, "Confirm your new password", confirmPassController, TextInputType.text),
             SizedBox(height: 30,),
             CommonButtonForAllApp(title: 'Reset',onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>ResetPassSuccess()));
             },),
             const SizedBox(height: 10),


           ],
         ),
       ),
     ),
   );
  }

}